# config/initializers/rabbitmq.rb

require 'bunny'

BUNNY_CONFIG = {
  hostname: '172.20.0.4',
  username: 'admin',
  password: 'admin'
}

BUNNY_CONNECTION = Bunny.new(BUNNY_CONFIG)
BUNNY_CONNECTION.start
