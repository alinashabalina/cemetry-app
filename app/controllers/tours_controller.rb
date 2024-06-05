class ToursController < ApplicationController

  def all_subscriptions
    @user = current_user
    @subscriptions = UserSubscription.all.where("user_id": current_user.id)
    @subscriptions.each do |subscription|
      @tours = Tour.all.where("guide_id": subscription.guide_id)
      ToursChannel.broadcast_to(@user, @tours)
    end

  end

  def suggest
    @tour = Tour.new
  end

  def create
    @user = current_user
    @tour = Tour.new(tour_params)
    @tour.guide_id = current_user.guide_id
    if @tour.save
      ToursChannel.broadcast_to(@user, @tour)
      UpdateTourJob.perform_now(@tour)
      redirect_to root_path, notice: "Wait for our letter"
      # UserMailer.application_email(@user).deliver
       else
        redirect_to root_path, notice: "You have unsuccessfully suggested your tour"
    end
  end


  private

  def tour_params
    params.require(:tour).permit(:city_id, :graveyard_id, :title, :guide_id)
  end
end
