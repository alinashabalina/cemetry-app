class Graveyard < ApplicationRecord
  belongs_to :city
  geocoded_by :address
  validates :title, presence: true
  validates :address, presence: true
  validates :city_id, presence: true
  validates :details, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end
