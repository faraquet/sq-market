json.deals @deals do |deal|
	json.seller_id deal.seller_id
	json.buyer deal.buyer_id
	json.product deal.product.title
	json.quantity deal.quantity
	json.price deal.price
	json.total deal.total
end
