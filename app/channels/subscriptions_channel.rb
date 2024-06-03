class SubscriptionsChannel < ApplicationCable::Channel
  def subscribed
    @guide = Guide.find(params[:guide_id])
    stream_for @guide
  end



end
