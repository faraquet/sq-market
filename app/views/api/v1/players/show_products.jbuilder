json.products @player_products do |player_product|
	json.product player_product.product.title
	json.level player_product.product.required_level
	json.amount player_product.amount
end
json.free_space @stock.free_space