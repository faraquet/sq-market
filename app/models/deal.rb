class Deal < ApplicationRecord
  belongs_to :product
  before_validation :set_players

  validate :buyer_must_have_enough_money,
           :buyer_must_have_enough_level

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

end
