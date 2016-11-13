class PlayerProduct < ApplicationRecord
  belongs_to :stock
  belongs_to :product

  after_save :set_stock_free_space
  after_destroy :set_stock_free_space
  
  def set_stock_free_space
    @stock = self.stock
    @player_products = PlayerProduct.where(stock_id: @stock.id)
    if @player_products.nil?
      binding.pry
      @stock.free_space = @stock.volume
    else
      @stock_occupied = @player_products.sum {|p| p[:amount]}
      @stock.free_space = @stock.volume - @stock_occupied
    end
    @stock.save 
  end
end
