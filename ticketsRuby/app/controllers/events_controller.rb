class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  
  def create
    event_parmas = params.require(:event).permit(:artist, :description, :price_low, :price_high, :event_date)
    @event = Event.new(event_parmas)
    if @event.save
      flash[:komunikat] = 'Event was successfully created'
      redirect_to "/events/#{@event.id}"
    else
      render 'new'
    end
  end

  def show
  end
  
  # def edit //TODO console.log
  # end

  # def update
  #   respond_to do |format|
  #     if @event.update(event_params)
  #       format.html { redirect_to @event, notice: 'Event was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @event }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @event.destroy
  #   respond_to do |format|
  #     format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:artist, :description, :price_low, :price_high, :event_date)
    end
end
