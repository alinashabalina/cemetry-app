class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @guide = Guide.where("user_id": @user.id)[0]
    @bookings = Booking.where("user_id": @user.id)
    if @guide
      @is_guide = "true"
    else
      @is_guide = "false"
    end
  end

  def apply
    @user = current_user
    @guide= Guide.new(guide_params)
    @city = Wheres.where("title": guide_params[:city_id])
    @guide.city = @city.id
  end

end
