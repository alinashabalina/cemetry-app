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
      end
    else
      respond_to do |format|
        msg = { :status => 404, :message => @guide.errors.full_messages }
        format.json  { render :json => msg }
      end
    end
  end

  def show
    @guide = Guide.find(params[:id])
  end

    def edit
      @guide = Guide.find(params[:id])
    end

    def apply
      @guide = Guide.new
    end

  def create
    @guide= Guide.new(guide_params)
    @user = current_user
    if @guide.save
      redirect_to root_path, notice: "You have successfully applied"
       else
         respond_to do |format|
           msg = { :status => 400, :message => @guide.errors.full_messages }
           format.json  { render :json => msg }
         end
       end
  end

  private

  def guide_params
    params.require(:guide).permit(:social_1, :social_2, :social_3, :bio, :photo, :city_id, :name)
  end

end
