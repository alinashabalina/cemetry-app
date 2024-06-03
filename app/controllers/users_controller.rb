class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def apply
    @user = current_user
    @guide= Guide.new(guide_params)
    @city = City.find(2) # don't forget to fix later for debug only
    @guide.city = @city
  end

end
