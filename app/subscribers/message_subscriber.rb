class MessageSubscriber
  def initialize(queue_name)
    @queue_name = queue_name
  end

  def subscribe
    channel = BUNNY_CONNECTION.create_channel
    queue = channel.queue(@queue_name, durable: true)

    prefetch_count = 1
    channel.prefetch(prefetch_count)

    consumer = queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
      process_message(payload)

      channel.ack(delivery_info.delivery_tag)
    end

    loop do
      sleep 1
    end
  end

  def process_message(payload)
    raise NotImplementedError
  end
end
