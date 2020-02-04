class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :edit, :update, :destroy]

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.all
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    if params[:option_id]
      puts "****************** Country Show **********************"
      option = Option.find(params[:option_id])
      puts option.title
      @country.options << option
      @country.events << option.event
      consequence_too(option, @country)
      if params[:turn] == "true"
        puts "********************* Params Turn *******************"
        @country.year += 5
        @country.deg += 0.05
        # @country.deg += 0.003 * (2 ** ((@country.year - 2020) / 5))
        if @country.reg_rel == "war"
          puts "War"
          if @country.civ_num > 1.1
            print "@country.civ_num: #{@country.civ_num} >>"
            @country.civ_num -= 1
            puts " #{@country.civ_num}"
          else
            @country.lose = true
            @country.is_conquered = true
            puts "Conquered and Lost by Civ_num"
          end
          if @country.budget > 1.01
            print "@country.budget: #{@country.budget} >>"
            @country.budget -= 1
            puts " #{@country.budget}"
          else
            @country.lose = true
            @country.is_conquered = true
            puts "Conquered and Lost by Budget"
          end
        end
        if @country.resilience == "civil_war"
          puts "Civil War"
          if @country.civ_num > 1.1
            print "@country.civ_num: #{@country.civ_num} >>"
            @country.civ_num -= 1
            puts " #{@country.civ_num}"
          else
            @country.lose = true
            @country.is_torn_apart = true
            puts "Torn Apart and Lost by Civ_num"
          end
          if @country.budget > 1.01
            print "@country.budget: #{@country.budget} >>"
            @country.budget -= 1
            puts " #{@country.budget}"
          else
            @country.lose = true
            @country.is_torn_apart = true
            puts "Torn Apart and Lost by Budget"
          end
        end
        @country.save!
      end
      redirect_to event_path(id: 1, country_id: @country.id)
    end
    if params[:lose]
      @country.lose = true
      @country.set_score
      @country.save
      redirect_to game_over_country_path(country_id: @country.id)
    end
  end

  # GET /countries/new
  def new
    @country = Country.new
    set_costs(@country)
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)
    set_costs(@country)
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

  def game_over
    @country = Country.find(params[:country_id])
  end

  private

  def set_costs(country)
    @agriculture_costs = {
      high: (country.init_civ * 0.5 + 3).to_i,
      medium: (country.init_civ * 0.3 + 2).to_i,
      low: (country.init_civ * 0.1 + 1).to_i,
    }
    @education_costs = {
      high: (country.init_civ * 0.5 + 3).to_i,
      medium: (country.init_civ * 0.3 + 2).to_i,
      low: (country.init_civ * 0.1 + 1).to_i,
    }
    @security_costs = {
      high: (country.init_civ * 0.5 + 3).to_i,
      medium: (country.init_civ * 0.3 + 2).to_i,
      low: (country.init_civ * 0.1 + 1).to_i,
    }
    @comms_costs = {
      high: (country.init_civ * 0.5 + 3).to_i,
      medium: (country.init_civ * 0.3 + 2).to_i,
      low: (country.init_civ * 0.1 + 1).to_i,
    }
    @social_sec_costs = {
      high: (country.init_civ * 0.5 + 3).to_i,
      medium: (country.init_civ * 0.3 + 2).to_i,
      low: (country.init_civ * 0.1 + 1).to_i,
    }
    @health_costs = {
      high: (country.init_civ * 0.5 + 3).to_i,
      medium: (country.init_civ * 0.3 + 2).to_i,
      low: (country.init_civ * 0.1 + 1).to_i,
    }
    @water_costs = {
      high: (country.init_civ * 0.5 + 3).to_i,
      medium: (country.init_civ * 0.3 + 2).to_i,
      low: (country.init_civ * 0.1 + 1).to_i,
    }
    @energy_costs = {
      high: (country.init_civ * 0.5 + 3).to_i,
      medium: (country.init_civ * 0.3 + 2).to_i,
      low: (country.init_civ * 0.1 + 1).to_i
    }
  end

    def consequence_too(option, country)
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
      case option.on_what2
      when "budget", "life_level"
        country.send "#{option.on_what2}=".to_sym, country.send(option.on_what2) + option.amount2.to_i
      when "civ_num", "deg"
        country.send "#{option.on_what2}=".to_sym, country.send(option.on_what2) + option.amount2
      when "resilience", "reg_rel", "agriculture", "education", "security", "comms", "social_sec", "health", "water", "energy"
        country.send "#{option.on_what2}=".to_sym, country.read_attribute_before_type_cast(option.on_what2.to_sym) + option.amount2
      end
      puts "#{option.on_what2}: #{country.send(option.on_what2)}"
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
