class EventSubscriber < MessageSubscriber
  def initialize(queue_name)
    super(queue_name)
  end

  def process_message(payload)
    response = CreateEvent.call(params: JSON.parse(payload))

    if response.success?
      puts "Event created: #{response.event.inspect}"
    else
      puts "Event creation failed: #{response.message}"
    end
  end
end
