class Deal < ApplicationRecord
  belongs_to :product
  before_validation :set_players
  validate :buyer_must_have_enough_money,
           :buyer_must_have_enough_level,
           :buyer_must_have_enough_free_space,
           :buyer_cant_be_seller

  after_save :update_players_balance, :update_players_products

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
    errors.add(:buyer, "Buyer have not free space in stock") if (@buyer.stock.free_space < quantity)
  end

  def buyer_cant_be_seller
    errors.add(:buyer, "Buyer and seller can't pe one person") if (@buyer == @seller)
  end

  def update_players_balance
    @buyer.balance -= total
    @seller.balance -= total
    @buyer.save
    @seller.save
  end

  def update_players_products
    @buyer_product = PlayerProduct.find_by(stock_id: @buyer.stock.id, product_id: @product.id)
    if @buyer_product.nil?
      PlayerProduct.create(stock_id: @buyer.stock.id, product_id: @product.id, amount: quantity)
    else
      @buyer_product.amount += quantity
      @buyer_product.save
    end

    @seller_product = PlayerProduct.find_by(stock_id: @seller.stock.id, product_id: @product.id)
    @seller_product.amount -= quantity
    if @seller_product.amount == 0
      PlayerProduct.destroy(@seller_product) 
    else
      @seller_product.save 
    end
  end
end
