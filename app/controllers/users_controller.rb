class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @guide = Guide.where("user_id": @user.id)[0]
    if @guide
      @is_guide = "true"
    else
      @is_guide = "false"
    end
  end

  def apply
    @user = current_user
    @guide= Guide.new(guide_params)
    @city = City.find(2) # don't forget to fix later for debug only
    @guide.city = @city
  end

end
