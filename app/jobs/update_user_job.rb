class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    sleep 60
    user.role = "guide"
    user.save!
  end
end
