class SubscriberChannel < ApplicationCable::Channel
  def subscribed
    guide = Guide.find(current_user.id)
    stream_for guide
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
