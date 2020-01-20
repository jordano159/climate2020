class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.all
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    if params[:option_id]
      option = Option.find(params[:option_id])
      consequence_too(option, @country)
      redirect_to event_path(id: 1, country_id: @country.id, turn: true)
    end
  end

  # GET /countries/new
  def new
    @country = Country.new

  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    @country.resilience = :excellent
    @country.reg_rel = :excellent
    @country.init_civ = rand(10.0..80.0).round(2)
    @country.civ_num = @country.init_civ
    @country.deg = 1.0
    @country.life_level = 10
    @country.budget = (@country.civ_num * rand(2..4)).to_i
    @country.score = 0
    @country.year = 2020
    @country.is_conquered = false

    respond_to do |format|
      if @country.save
        format.html { redirect_to event_path(id: 1, country_id: @country.id) }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def consequence_too(option, country)
      # operator.plus? ? operator = :+ : operator = :-
      puts "****************************************"
      puts "#{option.on_what}: #{country.send(option.on_what)} + #{option.amount}"
      case option.on_what
      when "budget", "life_level"
        country.send "#{option.on_what}=".to_sym, country.send(option.on_what) + option.amount.to_i
      when "civ_num", "deg"
        country.send "#{option.on_what}=".to_sym, country.send(option.on_what) + option.amount
      when "resilience", "reg_rel", "agriculture", "education", "security", "comms", "social_sec", "health", "water", "energy"
        country.send "#{option.on_what}=".to_sym, country.read_attribute_before_type_cast(option.on_what.to_sym) + option.amount
      end
      puts "#{option.on_what}: #{country.send(option.on_what)}"
      country.save!
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name, :budget, :resilience, :init_civ, :civ_num, :deg, :life_level, :score, :year, :reg_rel, :is_conquered, :agriculture, :education, :security, :comms, :social_sec, :health, :water, :energy)
    end
end
