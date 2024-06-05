class GuidesController < ApplicationController

  def index
    @guides = Guide.all
  end

  def info
    @guide = Guide.find(params[:id])
    if @guide
      respond_to do |format|
        msg = { :status => 200, :message => {:bio => @guide.bio}}
        format.json  { render :json => msg }
        puts msg
      end
    else
      respond_to do |format|
        msg = { :status => 404, :message => @guide.errors.full_messages }
        format.json  { render :json => msg }
        puts msg
      end
    end
  end

  def show
    @guide = Guide.find(params[:id])
    if @guide.user_id == current_user.id
      @self = "yes"
    else
      @self = "no"
    end
    sbscr = UserSubscription.where("guide_id": @guide.id)
    @count =  sbscr.count
    if current_user
      @subscription = UserSubscription.where("user_id": current_user.id, "guide_id": @guide.id).last
      if @subscription
        @id = "yes"
      else
        @id = "none"
      end
    else
      flash[:notice] = "You need to login to subscribe"
    end
end

    def edit
      @guide = Guide.find(params[:id])
    end

    def apply
      @guide = Guide.new
    end

  def create
    @guide = Guide.new(guide_params)
    @user = current_user
    @guide.user_id = @user.id
    Cloudinary::Uploader.upload(guide_params[:photo])
    @user.role = "pending"
    if @guide.save!
      @user.guide_id = @guide.id
      @user.save!
      redirect_to all_guides_path
      UpdateUserJob.perform_now(@user)
      # UserMailer.application_email(@user).deliver
       else
         respond_to do |format|
           msg = { :status => 400, :message => @guide.errors.full_messages }
           format.json  { render :json => msg }
         end
       end
  end

  private

  def guide_params
    params.require(:guide).permit(:social_1, :social_2, :social_3, :bio, :city_id,:photo, :name)
  end

end
