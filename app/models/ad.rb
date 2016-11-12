class Ad < ApplicationRecord
  belongs_to :player
  belongs_to :products
  before_validation :set_player, :set_product

  validate: :price_should_be_50percents_max

  def set_player
    @player = Player.find(player_id)
  end

  def set_product
    @product = Product.find(product_id)
  end

  def price_should_be_50percents_max
  end

end
