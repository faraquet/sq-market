class Ad < ApplicationRecord
  belongs_to :player
  belongs_to :product
  has_one :deal

  validates :player, presence: true
  validates :product, presence: true

  validate :player_have_enough_products, 
           :price_in_50percents_range, 
           :player_have_ads_limit,
           :quantity_can_not_be_zero,
           if: 'player_and_product_present?'

  before_create :calculate_total
  
  def player_and_product_present?
    player.present? && product.present?
  end

  def player_have_enough_products
    @product_occupied = Ad.where(player_id: player.id, product_id: product.id).sum {|p| p[:quantity]}
    @product_in_stock = PlayerProduct.find_by(stock_id: player.stock.id, product_id: product.id)
    if @product_in_stock.nil? 
      errors.add(:product, 'Player have not products in stock')
    else
        @product_free = @product_in_stock.amount - @product_occupied
      if @product_free <= 0 || @product_in_stock.amount < quantity
        errors.add(:product, 'Player have not enought products')
      end
    end
  end

  def price_in_50percents_range
    if (product.price * 1.5) < price
      errors.add(:product, "Mark-up can't be more 50%")
    elsif (product.price * 0.5) > price
      errors.add(:product, "Discount can't be more 50%")
    end
  end

  def player_have_ads_limit
    limit = YmlParser.new.market_ads_limit
    players_ads_quantity = Ad.where(player_id: player.id).count
    errors.add(:player, "Player can't exceed ads limit") if limit <= players_ads_quantity
  end

  def quantity_can_not_be_zero
    errors.add(:product, "Quantity can't be zero") if quantity.zero?
  end

  def calculate_total
    self.total = self.price * self.quantity
  end
end
