class ToursController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @tours = Tour.all
    @tours.each do |tour|
      @guide = Guide.find(tour.guide_id)
    end
  end

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
    @tour.guide_id = @user.guide_id
    if @tour.save!
      ToursChannel.broadcast_to(@user, @tour)
      UpdateTourJob.perform_now(@tour)
      redirect_to root_path, notice: "Wait for our letter"
      # UserMailer.application_email(@user).deliver
       else
        redirect_to root_path, notice: "You have unsuccessfully suggested your tour"
    end
  end


  def show
    @tour = Tour.find(params[:id])
    @guide = Guide.find(@tour.guide_id)
  end


  def book
    if current_user
      @user = current_user
      @tour = Tour.find(params[:id])
      @booking = Booking.new("user_id": @user.id, "tour_id": @tour.id)
      if @booking.save
        respond_to do |format|
          msg = { :status => 201, :message => {:info => @booking.id}}
          format.json  { render :json => msg }
        end
      end
    else
      respond_to do |format|
      msg = { :status => 400, :message => {:info => "Log in to book a tour"}}
      format.json  { render :json => msg }
      end
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:city_id, :graveyard_id, :title)
  end
end
