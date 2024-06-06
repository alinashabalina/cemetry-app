class SelfChannel < ApplicationCable::Channel
  def subscribed
    user = User.find(params[:id])
    stream_for user
    guide = Guide.where("user_id": user.id)[0]
    tour = Tour.where("guide_id": guide.id)[0]
    transmit tour
  end

  def unsubscribed
    transmit "Disconnected"
  end
end
