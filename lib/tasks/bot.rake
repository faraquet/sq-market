namespace :bot do
  desc "Sell random command"
  task sell: :environment do
    @player = Player.all.sample
    @player_product = PlayerProduct.where(stock_id: @player.stock).sample
    @product = @player_product.product
    @quantity = @player_product.amount
    @price = (@product.price * rand(1.1..1.4)).round(2)
    @ad = Ad.new(player_id: @player.id, product_id: @product.id, quantity: @quantity, price: @price)
    @log = Logger.new('log/bot_sell.log')
    if !@ad.valid?
      @log.error(@ad.errors)
      puts @ad.errors.full_messages
    else
      @ad.save
    end
  end

  desc "Buy random command"
  task buy: :environment do
    @player = Player.all.sample
    @ad = Ad.all.sample
    @deal = Deal.new(seller_id: @ad.player_id, buyer_id: @player.id, 
        product_id: @ad.product_id, quantity: @ad.quantity, price: @ad.price, total: @ad.total)
    @log = Logger.new('log/bot_buy.log')
    if !@deal.valid?
      @log.error(@deal.errors)
      puts @deal.errors.full_messages
    else
      @deal.save
      Ad.destroy(@ad)
    end
  end

end