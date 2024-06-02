class SubscriberChannel < ApplicationCable::Channel
  def subscribed
    guide = Guide.find(params[:id])
    stream_for guide
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
