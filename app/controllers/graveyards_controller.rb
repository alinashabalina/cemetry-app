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
    @count = Graveyard.count
    @marker = [{
      lat: @graveyard.latitude,
      lng: @graveyard.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {graveyard: @graveyard})
    }]

    @tours = Tour.where("graveyard_id":params[:id])
    GraveyardsChannel.broadcast_to(@graveyard, @tours)
end

def info
end
end
