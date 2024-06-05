class Guide < ApplicationRecord
  belongs_to :city
  has_one_attached :photo
end
