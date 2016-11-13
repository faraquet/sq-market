class PlayerProduct < ApplicationRecord
  belongs_to :stock
  belongs_to :product

  before_validation :set_stock

  after_save :set_stock_free_space
  after_destroy :set_stock_free_space
  def set_stock
    @stock = self.stock
  end

  def set_stock_free_space
    @stock_occupied = PlayerProduct.where(stock_id: @stock.id).sum {|p| p[:amount]}
    @stock.free_space = @stock.volume - @stock_occupied
    @stock.save 
  end
end
