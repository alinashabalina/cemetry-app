class City < ApplicationRecord
  has_many :graveyards
  validates :title, presence: true
  validates :country, presence: true
end
