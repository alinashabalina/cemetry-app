class GraveyardsChannel < ApplicationCable::Channel
  def subscribed
    graveyard = Graveyard.find(params[:id])
    puts graveyard
    stream_for graveyard
  end

  def unsubscribed
    transmit "Disconnected"
  end
end
