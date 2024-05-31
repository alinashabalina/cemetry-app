class GuidesController < ApplicationController

  def index
    @guides = Guide.all
  end

  def show
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
end
