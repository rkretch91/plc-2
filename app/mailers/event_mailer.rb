class EventMailer < ApplicationMailer

  def booking_confirmation(event)
    @event = event

    mail(
      to: @event.users.last.email,
      subject: "You are headed to #{@event.event_name}!"
      )
  end
end
