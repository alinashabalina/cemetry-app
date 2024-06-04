class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    if current_user
      @subscription = UserSubscription.new("user_id": current_user.id, "guide_id": params[:guide_id])
      guide = Guide.find(params[:guide_id])
      if @subscription.save
        number = UserSubscription.where(guide_id: params[:guide_id])
        @count = number.count
        SubscriptionsChannel.broadcast_to(guide, @count)
      end
    end
  end
end
