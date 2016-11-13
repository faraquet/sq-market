json.deals @deals do |deal|
	json.seller Player.find(deal.seller_id).name
	json.buyer Player.find(deal.buyer_id).name
	json.product deal.product.title
	json.quantity deal.quantity
	json.price deal.price
	json.total deal.total
end
