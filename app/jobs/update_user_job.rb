class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "updating application status"
    user.role = "guide"
    sleep 3
    puts "Done!"
  end
end
