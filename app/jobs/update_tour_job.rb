class UpdateTourJob < ApplicationJob
  queue_as :default

  def perform(tour)
    sleep 3
    tour.status = "approved"
    tour.save!
  end
end
