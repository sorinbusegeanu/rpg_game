extends Node

# The Shop Manager handles the transaction logic in the Castle Hub.
# It translates currency (Gold) into permanent attributes for the party.

var upgrade_data = load("res://scripts/upgrade_data.gd").new()
var player_gold: int = 0
var current_upgrades_purchased: Array = [] # Tracks what the player has already bought

func _init():
	pass

# Initialize shop state
func setup_shop(starting_gold: int):
	player_gold = starting_gold
	print("Shop Opened. Current Gold: ", player_gold)

# Handle purchasing an upgrade from the catalog
func attempt_purchase(upgrade_index: int) -> bool:
	var item = upgrade_data.available_upgrades[upgrade_index]
	
	if player_gold >= item.cost:
		player_gold -= item.cost
		current_upgrades_purchased.append(item)
		print("Successfully purchased ", item.name, ". Remaining Gold: ", player_gold)
		return true
	else:
		print("Not enough gold! Need ", item.cost, " but only have ", player_gold)
		return false

# Returns a summary of the current wealth and inventory for UI display
func get_player_stats():
	return {
		"gold": player_gold,
		"purchased_count": current_upgrades_purchased.size()
	}

# The items can be used to adjust character stats in game_data or entities logic
func apply_upgrade_to_character(hero_name: String, upgrade_index: int):
	var item = upgrade_data.available_upgrades[upgrade_index]
	# Logic would find the hero by name and add 'item.val' to their respective stat.
	print("Applying ", item.name, " to ", hero_name)
fi
