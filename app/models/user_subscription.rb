class UserSubscription < ApplicationRecord
  has_many :users
  has_many :guides
  validates :user_id, presence: true
  validates :guide_id, presence: true
end
