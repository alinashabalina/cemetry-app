class CitiesController < ApplicationController

  def index
    @cities = City.all.last(7)
    if params[:title].present?
      @cities=City.all.where("lower(title) = ?", params[:title].downcase)
    end
  end

  def show
    @city = City.find(params[:id])
    @graveyards = Graveyard.all.where(city_id: params[:id])
end
end
