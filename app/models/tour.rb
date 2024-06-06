class Tour < ApplicationRecord
  belongs_to :guide
  belongs_to :graveyard
  belongs_to :city
  validates :title, presence: true
  validates :guide_id, presence: true
  validates :graveyard_id, presence: true
  validates :city_id, presence: true
  validates :status, presence: true
end
