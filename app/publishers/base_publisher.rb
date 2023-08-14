# app/publishers/base_publisher.rb

class BasePublisher
  def self.publish(queue_name, message)
    channel = BUNNY_CONNECTION.create_channel
    queue = channel.queue(queue_name, durable: true)

    message_payload = message.to_json

    queue.publish(message_payload, persistent: true)

    channel.close
  end
end
