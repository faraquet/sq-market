json.ads @ads do |ad|
	json.id ad.id
	json.player ad.player.name
	json.product ad.product.title
	json.quantity ad.quantity
	json.price ad.price
	json.total ad.total
end
