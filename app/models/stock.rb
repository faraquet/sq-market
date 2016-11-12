class Stock < ApplicationRecord
  belongs_to :player
  before_create :load_config

  def load_config
    self.volume = YmlParser.new.stock_volume
  end
end
