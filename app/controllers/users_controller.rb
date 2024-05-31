class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def subscribe
    if current_user
      @subscription = UserSubscription.new("user_id": current_user, "guide_id": params[:id])
      if @subscription.save
        respond_to do |format|
          msg = { :status => 201, :message => "You have successfully subscribed" }
          format.json  { render :json => msg }
        end

       SubscriptionChannel.broadcast_to(
          @guide,
          render_to_string(partial: "message", locals: {subscription: @subscription})
        )
        head :ok
      else
        respond_to do |format|
          msg = { :status => 400, :message => @guide.errors.full_messages }
          format.json  { render :json => msg }
        end
      end
    else
      redirect_to user_new_session_path
    end
  end
end
