class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    if current_user
      @subscription = UserSubscription.new("user_id": current_user.id, "guide_id": params[:guide_id])
      if @subscription.save!
        SubscriptionsChannel.broadcast_to(
            @guide,
            render_to_string(partial: "message", locals: {subscription: @subscription})
          )
          head :created
      else
        puts "hru"
      end
    end
  end
end
