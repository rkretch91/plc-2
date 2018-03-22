class EventsController < ApplicationController
  def index
    @events = policy_scope(Event)
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(events_params)
    @user = current_user
    @event.users << @user #technically known as host
    authorize @event
    if @event.save
      redirect_to @event, notice: "Potluck Club event added to the system!"
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    @event.update(events_params)
    redirect_to @event, notice: "Your Potluck Club event was updated!"
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
    redirect_to events_path, notice: "Your Potluck Club event was deleted!"
  end

  def booking
    @user = current_user
    @event = Event.find(params[:id])
    authorize @event
    if @event.users.include?(current_user)
      redirect_to @event, alert: "You have already booked this event"
    else
      @event.users << @user
      redirect_to event_path(@event), notice: "Your name has been added to this Potluck Club event! You will receive more details over email soon."
    end
  end

  private

  def events_params
    params.require(:event).permit(:city, :event_name, :description, :date, :start_time, :end_time, :rsvp_limit, {photos: []})
  end
end

