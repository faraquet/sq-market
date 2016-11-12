class Ad < ApplicationRecord
  belongs_to :player
  belongs_to :product
  before_validation :set_player
  before_validation :set_product

  # # validate :product_should_belong_to_user,
  # #          :price_should_be_50percents_max

  def set_player
    @player = Player.find(self.player_id)
  end

  def set_product
    @product = Product.find(product_id)
  end

end
