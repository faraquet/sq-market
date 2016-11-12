class Deal < ApplicationRecord
  belongs_to :ad
  belongs_to :player
end
