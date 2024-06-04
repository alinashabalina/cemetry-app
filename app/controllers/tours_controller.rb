class ToursController < ApplicationController
  def suggest
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.guide_id = current_user.guide_id
    puts @tour.guide_id
    if @tour.save
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
