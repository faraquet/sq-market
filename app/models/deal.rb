class Deal < ApplicationRecord
  belongs_to :product

  belongs_to :buyer, :class_name => 'Player'
  belongs_to :seller, :class_name => 'Player'

  validates :buyer, presence: true
  validates :seller, presence: true

  validate :buyer_have_enough_money,
           :buyer_have_enough_level,
           :buyer_have_enough_free_space,
           :buyer_cant_be_seller,
           if: 'players_present?'

  after_save :update_players_balance, :update_players_products, :update_players_exp
  
  def players_present?
    buyer.present? && seller.present?
  end

  def buyer_have_enough_money
    errors.add(:buyer, 'Buyer have not enough money') if (buyer.balance < total)
  end

  def buyer_have_enough_level
    errors.add(:buyer, 'Buyer have not enough level') if (buyer.level < product.required_level)
  end

  def buyer_have_enough_free_space
    errors.add(:buyer, 'Buyer have not free space in stock') if (buyer.stock.free_space < quantity)
  end

  def buyer_cant_be_seller
    errors.add(:buyer, "Buyer and seller can't pe one person") if (buyer == seller)
  end

  def update_players_balance
    buyer.balance -= total
    seller.balance += total
    buyer.save
    seller.save
  end

  def update_players_products
    @buyer_product = PlayerProduct.find_by(stock_id: buyer.stock.id, product_id: product.id)
    if @buyer_product.nil?
      PlayerProduct.create(stock_id: buyer.stock.id, product_id: product.id, amount: quantity)
    else
      @buyer_product.amount += quantity
      @buyer_product.save
    end

    @seller_product = PlayerProduct.find_by(stock_id: seller.stock.id, product_id: product.id)
    @seller_product.amount -= quantity
    if @seller_product.amount.zero?
      PlayerProduct.destroy(@seller_product) 
    else
      @seller_product.save
    end

    def update_players_exp
      buyer.experience += 2**product.required_level * quantity * 10
      seller.experience += 2**product.required_level * quantity * 10
      seller.level = (Math.log2(seller.experience / 100) + 1).floor
      buyer.level = (Math.log2(buyer.experience / 100) + 1).floor
      buyer.save
      seller.save
    end
  end
end
