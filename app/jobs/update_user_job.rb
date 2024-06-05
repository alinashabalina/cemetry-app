class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    sleep 3
    user.role = "guide"
    user.save!
  end
end
