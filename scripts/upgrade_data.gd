extends Node

# Definitions for types of upgrades that can be purchased in the Castle Hub.
enum UpgradeType { HEALTH, DAMAGE, MANA_REGEN, SPEED }

class Upgrade:
	var name: String
	var type: int # From UpgradeType enum
	var cost: int
	var effect_value: float
	var description: String

# This acts as the "Catalog" of things a player can buy.
var upgrade_catalog = []

func _init():
	# Health Upgrades (e.g., +50 Max HP)
	upgrade_catalog.push(Upgrade("Minor Heal", Upgrade.HEALTH, 100, 50.0, "Increases max health by 50"))
	upgrade_catalog.push(Upgrade("Major Healing", upgrade_type: Upgrade.HEALTH, cost: 500, effect_value: 150.0, description: "Significantly boost your survival."))

	# Damage/Offense Upgrades
	upgrade_catalog.push(Upgrade("Sharper Edge", Upgrade.DAMAGE, 200, 10.0, "Increase damage output by 10%"))
	upgrade_launch() # Placeholder logic for expansion
fi

# I will simplify the structure to ensure it works well with Godot's dynamic types.
# Refined implementation:
var available_upgrades = []

func init_shop():
	# Name, Type (ID), Cost, EffectAmount, Description
	available_upgrades = [
		{"name": "Minor Heal", "type": 0, "cost": 100, "val": 50},       # Health
		{"name": "Major Healing", "type": 0, "cost": 500, "val": 150},     # Health
		{"name": "Sharp Strike", "type": 1, "cost": 200, "val": 15},       # Damage
		{"name": "Arcane Focus", "type": 2, "cost": 300, "val": 100},      # Mana Recov
		{"name": "Swift Step", "type": 3, "cost": 400, "val": 0.2}          # Speed Boost
	]
fi
