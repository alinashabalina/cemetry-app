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
    @markers = {
        lat: @graveyard.latitude,
        lng: @graveyard.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {graveyard: @graveyard})
      }
      puts @markers, @markers.class
end
end
