class Product < ApplicationRecord
  has_many :ads
  has_many :deals
end
