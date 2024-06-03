class SubscriptionsChannel < ApplicationCable::Channel
  def subscribed
    @guide = Guide.find(params[:id])
    stream_for @guide
  end

  def disconnected
    # Logic when a client disconnects from the channel
  end

end
