extends Node

# The UI Manager handles the visual translation of game states.
# It manages "Cards" for characters, shop items, and status indicators.

class CardData:
	var id: int
	var name: String
	var health_percent: float
	var mana_percent: float
	var special_active: bool

var active_cards = []

func _init():
	pass

# Update logic for character cards (Heart/Health and Mana bars)
func update_character_cards(hero_list: Array):
	for i in range(hero_list.size()):
		hero = hero_list[i]
		active_cards[i] = {
			"name": hero.name,
			"health_pct": float(hero.health) / hero.max_heart if hasattr(hero, "max_heart") else float(hero.health)/hero.max_health,
			"mana_pct": float(hero.mana) / 1000.0,
			"special_ready": hero.can_use_special()
		}

# Ritualistic visual feedback for the "Brutal" special move effect.
func trigger_pulse_effect(hero_name: String):
	print("--- UI EVENT: PULSE ---")
	print("Visual/Audio cue triggered for: " + hero_name)

# Update the shop-specific display elements
func update_shop_ui(gold_amount: int, selected_index: int = -1):
	print("Updating Shop Display. Current Gold: ", gold_amount)
	if selected_index != -1:
		print("Highlighting item index: ", selected_index)

# Helper to format numbers for the UI (e.g., "500" -> "$ 500")
func format_currency(val: int) -> String:
	return "$" + str(val)
fi
