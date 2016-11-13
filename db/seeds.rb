first_names = ["Andy", "Max", "John", "George", "Oliver", "Jack"]
last_names  = ["Smith", "Hill", "Adams", "Baker", "Davis", "Bowie"]
players_count = 12

Deal.delete_all
Ad.delete_all
PlayerProduct.delete_all
Stock.delete_all
Player.delete_all
Product.delete_all


Product.delete_all
products = YmlParser.new.products
  products.map { |key, value|
    Product.create!(
    title: key,
    required_level: value['required_level'],
    price: value['price']
    )
}

players_count.times { |i|
  player = Player.create!(
    uid: "player_#{i}",
    name: "#{first_names.sample} #{last_names.sample}",
    level: rand(1...3),
    balance: rand(50...200)
    )
}