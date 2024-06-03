class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    if current_user
      @subscription = UserSubscription.new("user_id": current_user.id, "guide_id": params[:guide_id])
      if @subscription.save!
        SubscriptionsChannel.broadcast_to(@guide, message: "{\"channel\":\"SubscriptionsChannel\",\"id\":\"2\"}"
        )
        head :ok
      else

      end
    end
  end
end
