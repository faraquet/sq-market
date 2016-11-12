json.players @players do |player|
	json.id player.id
	json.name player.name
	json.uid player.uid
	json.level player.level
	json.experience player.experience
	json.balance player.balance
end
