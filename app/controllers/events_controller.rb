class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :edit, :create, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if params[:country_id]
      country = Country.find(params[:country_id])
      @event = Event.where("min_deg <= ?", country.deg).where.not(id: country.events).sample
      event_consequence(@event, country) if @event.amount.present? && @event.on_what.present?
      # @event = Event.where("min_deg <= ?", c.deg).sample
			# @event = Event.find(2)
      # if c.lose?
      #   redirect_to game_over_country_path(country_id: @country.id)
      # end
    else
      @event = Event.find(params[:id])
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def event_consequence(event, country)
    puts "****************************************"
    puts "#{event.on_what}: #{country.send(event.on_what)} + #{event.amount}"
    case event.on_what
    when "budget", "life_level"
      country.send "#{event.on_what}=".to_sym, country.send(event.on_what) + event.amount.to_i
    when "civ_num", "deg"
      country.send "#{event.on_what}=".to_sym, country.send(event.on_what) + event.amount
    when "resilience", "reg_rel"
      if country.read_attribute_before_type_cast(event.on_what.to_sym) + event.amount <= 6 && country.read_attribute_before_type_cast(event.on_what.to_sym) + event.amount >= 0
        country.send "#{event.on_what}=".to_sym, country.read_attribute_before_type_cast(event.on_what.to_sym) + event.amount
      end
    when "agriculture", "education", "security", "comms", "social_sec", "health", "water", "energy"
      if country.read_attribute_before_type_cast(event.on_what.to_sym) + event.amount <= 2 && country.read_attribute_before_type_cast(event.on_what.to_sym) + event.amount >= 0
        country.send "#{event.on_what}=".to_sym, country.read_attribute_before_type_cast(event.on_what.to_sym) + event.amount
      end
    end
    country.save!
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :min_deg, :amount, :on_what)
    end
end
