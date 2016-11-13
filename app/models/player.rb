class Player < ApplicationRecord
  has_one :stock
  has_many :ads
  has_many :purchases, :class_name => 'Deal', :foreign_key => 'buyer_id'
  has_many :deals, :class_name => 'Deal', :foreign_key => 'seller_id'

  before_create :exp_calculate
  after_create :prepare

  def exp_calculate
    self.experience = 2 ** (self.level - 1) * 100
  end

  def prepare
    self.stock = Stock.create
   
    PlayerProduct.create!(
      stock_id: self.stock.id,
      product_id: Product.where(["required_level <= ? ", self.level]).sample.id,
      amount: rand(1...self.stock.volume)
    )
  end
end
