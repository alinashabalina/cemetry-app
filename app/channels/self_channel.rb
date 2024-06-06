class SelfChannel < ApplicationCable::Channel
  def subscribed
    user = User.find(params[:id])
    stream_for user
  end

  def unsubscribed
    transmit "Disconnected"
  end
end
