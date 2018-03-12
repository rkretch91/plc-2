class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    @user = current_user
    @event.users << @user #technically known as host
    if @event.save
      redirect_to @event, notice: "Potluck Club event added to the system!"
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    @event.update(events_params)
    redirect_to @event, notice: "Your Potluck Club event was updated!"
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy
    redirect_to events_path, notice: "Your Potluck Club event was deleted!"
  end

  def booking
    @user = current_user
    @event = Event.find(params[:id])
    if @user.events.includes(@event)
      redirect_to @event, alert: "You have already booked this event"
    else
      @user.events << @event
      redirect_to @event, notice: "Your name has been added to this Potluck Club event! You will receive more details over email soon."
    end
  end

  private

  def events_params
    params.require(:event).permit(:event_name, :description, :event_date, :event_time_start, :event_time_end, :rsvp_limit)
  end
end

