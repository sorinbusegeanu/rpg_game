extends Node

# The Inventory Manager handles the collection, storage, and consumption of items.
# It integrates with both the Loot system (from exploration) and the Shop.

# Define what types of things can be carried.
enum ItemType {
	MATERIAL,    # Used for crafting (e.g., Wood, Iron)
	EQUIPMENT,   # Permanent stat boosts (e.g., Swords, Armor)
	CONSUMABLE,  # One-time use (e.g., Potions, Scrolls)
	QUEST_ITEM   # Items that cannot be sold or dropped
}

class Item:
	var id: int
	var name: String
	var type: int
	var rarity: String
	var value: int # The amount of gold it is worth if sold to a merchant
	var quantity: int
	
	func _init(id, name, item_type, rarity, val, qty=1):
		self.id = id
		self.name = name
		self.type = item_type
		self.rarity = rarity
		self.value = val
		self.quantity = qty

# The Master list of what the player is carrying.
var player_inventory: Array[Item] = []

func _init():
	pass

# Add an item to the inventory (called when loot is won in combat).
# This handles stacking items of the same ID/Name automatically.
func add_item(id, name, type, rarity, value, count=1):
	# Search for existing stack
	for i in range(player_inventory.size()):
		if player_inventory[i].name == name:
			player_inventory[i].quantity += count
			print("Added " + str(count) + "x " + name + " (Total: " + str(player_inventory[i].quantity) + ")")
			return
	
	# If not found, add as new entry
	new_item = Item(id, name, type, rarity, value, count)
	player_inventory.push(new_item)
	print("Acquired " + str(count) + "x " + name)

# Remove an item (called when consumed or traded).
func remove_item(name: String, amount: int = 1) -> bool:
	for i in range(player_inventory.size()):
		if player_inventory[i].name == name:
			if player_inventory[i].quantity >= amount:
				player_inventory[i].quantity -= amount
				# Remove if empty
				if player_inventory[i].quantity <= 0:
					player_inventory.remove(i)
				return true
	return false

# The 'Craft' logic: exchange materials for a specific item or upgrade.
func craft_item(recipe_name: String):
	print("Attempting to craft: " + recipe_name)
	# Example Logic: To make a 'Steel Blade', need 5 Iron Ore
	if recipe_name == "Steel Blade":
		if remove_item("Iron Ore", 5):
			print("Success! Crafted Steel Blade.")
			add_item(99, "Steel Blade", 1, "Rare", 500) # Item ID 99 for special items
            return true
    
	print("Crafting failed: missing materials or unknown recipe.")
	return false

# Get a list of all item names and amounts (for the UI display).
func get_inventory_summary():
	var summary = []
	for i in range(player_inventory.size()):
		summary.push(player_inventory[i].name + " x" + str(player_inventory[i].quantity))
	return summary

# Determine if a sell to the shop is possible.
func sell_to_shop(item_index: int) -> int:
	if item_index < player_inventory.size():
		item = player_inventory[item_index]
		val = item.value
		if remove_item(item.name, 1):
			print("Sold " + item.name + " for " + str(val) + " gold.")
			return val
    return 0
fi
