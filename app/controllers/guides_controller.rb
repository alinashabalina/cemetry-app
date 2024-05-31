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

    def create
      @guide= Guide.new(guide_params)
      @city = City.find(params[:city_id])
      @guide.city = @city
      if @guide.save
          respond_to do |format|
            msg = { :status => 201, :message => "You have successfully applied as a guide. We will send you an email with further instructions" }
            format.json  { render :json => msg }
          end
        else
          respond_to do |format|
            msg = { :status => 400, :message => @guide.errors.full_messages }
            format.json  { render :json => msg }
          end
        end
    end

    private

    def review_params
      params.require(:review).permit(:content, :stars, :visited_on)
    end

end
