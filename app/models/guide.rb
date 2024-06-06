class Guide < ApplicationRecord
  belongs_to :city
  has_one_attached :photo
  validates :name, presence: true
  validates :city_id, presence: true
  validates :bio, presence: true
  validates :user_id, presence: true
  validates :social_1, presence: true
end
