class PlayerProduct < ApplicationRecord
  belongs_to :stock
  belongs_to :product
end
