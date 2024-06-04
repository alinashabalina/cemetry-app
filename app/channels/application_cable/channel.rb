module ApplicationCable
  class Channel < ActionCable::Channel::Base
    after_subscribe :send_connected

  private
  def send_connected
    puts "connected!!!!!!"
    broadcast_to("subscriptions_cable", "Test")
  end
end
end
