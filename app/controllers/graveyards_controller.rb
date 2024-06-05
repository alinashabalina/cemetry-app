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
    @graveyard = Graveyard.where("city_id": params[:city_id], "id": params[:id])[0]
    GraveyardsChannel.broadcast_to(@graveyard, "lala")
    @marker = [{
      lat: @graveyard.latitude,
      lng: @graveyard.longitude
    }]
end

def info
end
end
