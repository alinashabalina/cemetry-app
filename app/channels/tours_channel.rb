class ToursChannel < ApplicationCable::Channel
  def subscribed
    user = User.find(params[:id])
    sbscrs = UserSubscription.where("user_id":params[:id])
    if sbscrs.length > 0
      sbscrs.each do |sbscr|
        tours = Tour.where("guide_id": sbscr.guide_id)
        stream_for user
        transmit tours
      end
    end
    end

  def unsubscribed
    transmit "Disconnected"
  end
end
