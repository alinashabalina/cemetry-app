class GraveyardsController < ApplicationController
  def index
    @graveyards = Graveyard.all
    @markers = @graveyards.geocoded.map do |graveyard|
      {
        lat: graveyard.latitude,
        lng: graveyard.longitude
      }
    end
  end

  def show
    @graveyard = Graveyard.find(params[:id])
    @marker = [{
      lat: @graveyard.latitude,
      lng: @graveyard.longitude
    }]
end
end
