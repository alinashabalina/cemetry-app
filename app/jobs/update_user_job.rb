class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "updating application status"
    user.role = "guide"
    user.save!
  end
end
