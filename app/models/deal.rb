class Deal < ApplicationRecord
  belongs_to :product
  before_validation :set_players

  validate :buyer_must_have_enough_money,
           :buyer_must_have_enough_level,
           :buyer_must_have_enough_free_space,
           :buyer_cant_be_seller

  def set_players
    @seller = Player.find(seller_id)
    @buyer = Player.find(buyer_id)
    @product = Product.find(product_id)
  end

  def buyer_must_have_enough_money
    errors.add(:buyer, "Buyer have not enough money") if (@buyer.balance < total)
  end

  def buyer_must_have_enough_level
    errors.add(:buyer, "Buyer have not enough level") if (@buyer.level < @product.required_level)
  end

  def buyer_must_have_enough_free_space
    errors.add(:buyer, "Buyer have not free space in stock") if (@buyer.stock.free_space < self.quantity)
  end

  def buyer_cant_be_seller
    errors.add(:buyer, "Buyer and seller can't pe one person") if (@buyer == @seller)
  end
end
