class UpdateTourJob < ApplicationJob
  queue_as :default

  def perform(tour)
    tour.status = "approved"
    tour.save!
  end
end
