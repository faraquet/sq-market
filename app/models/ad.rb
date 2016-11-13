class Ad < ApplicationRecord
  belongs_to :player
  belongs_to :product
  has_one :deal

  before_validation :set_player, :set_product 
  
  validate :player_must_have_enough_products,
           :price_should_be_50percents_max,
           :player_have_ads_limit

  before_create :calculate_total
  
  def set_player
    @player = Player.find(player_id)
    errors.add(:player, "Unknown player") if @player.nil?
  end

  def set_product
    @product = Product.find(product_id)
    errors.add(:product, "Unknown product") if @product.nil?
  end

  def player_must_have_enough_products
    @product_occupied = Ad.where(player_id: @player.id, product_id: @product.id).sum {|p| p[:quantity]}
    @product_in_stock = PlayerProduct.find_by(stock_id: @player.stock.id, product_id: @product.id)
    if @product_in_stock.nil? 
      errors.add(:product, "Player have not products in stock")
    else
        @product_free = @product_in_stock.amount - @product_occupied
      if @product_free <= 0 || @product_in_stock.amount < quantity
        errors.add(:product, "Player have not enought products")
      end
    end
  end

  def price_should_be_50percents_max
    if price > @product.price * 1.5
      errors.add(:product, "Mark-up can't be more 50%")
    end
  end

  def player_have_ads_limit
    limit = YmlParser.new.market_ads_limit
    players_ads_quantity = Ad.where(player_id: @player.id).count
    errors.add(:player, "Player can't exceed ads limit") if limit <= players_ads_quantity
  end

  def calculate_total
    self.total = self.price * self.quantity
  end
end
