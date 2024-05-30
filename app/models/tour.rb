class Tour < ApplicationRecord
  belongs_to :guide
  belongs_to :graveyard
  belongs_to :city
end
