class GraveyardsChannel < ApplicationCable::Channel
  def subscribed
    graveyard = Graveyard.find(params[:id])
    tours = Tour.where("graveyard_id":params[:id])
    stream_for graveyard
    transmit tours
  end

  def unsubscribed
    transmit "Disconnected"
  end
end
