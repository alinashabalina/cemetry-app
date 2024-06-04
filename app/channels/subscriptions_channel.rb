class SubscriptionsChannel < ApplicationCable::Channel
  def subscribed
    guide = Guide.find(params[:id])
    stream_for guide
  end

  def unsubscribed
    transmit "Disconnected"
  end
end
