class CreateEvent
  include Interactor

  def call
    event = Event.new(context.params)

    if event.save
      context.event = event
    else
      context.fail!(message: event.errors.full_messages)
    end
  end
end
