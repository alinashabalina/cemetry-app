class UpdateTourJob < ApplicationJob
  queue_as :default

  def perform(tour)
    sleep 60
    tour.status = "approved"
    tour.save!
  end
end
