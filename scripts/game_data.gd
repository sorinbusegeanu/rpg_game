extends Node

# --- CONTENT SYSTEM & DATA TABLES ---

# Defined as the items found in "loot bags" or dropped by monsters.
class LootItem:
	var name: String
	var type: String # Material, Relic, Essence
	var value: int   # Gold/Gold_Multiplier
	var rarity: String # Common, Rare, Legendary

# A structured way to handle rewards based on monster difficulty.
class RewardTable:
	var gold_base: int
	var exp_reward: int
	var special_drop_chance: float # 0.0 - 1.0
	var loot_pool: Array[LootItem]

# --- GAME ENTITIES ---

class Entity:
	var name: String
	var role: String        # Tank, Mage, Defender, AOE_DD, Boss, Minion
	var health: float
	var max_heart: float    # Hidden logic check for consistency
	var max_health: float
	var mana: float         # Current Mana (Max 1000)
	var action_speed: float # Timer values: 2.4, 3.0, 3.4
	var special_move: String
	
	func _init(_name: String, _role: String, _hp: float, _spd: float, _special: String = "None"):
		self.name = _name
		self.role = _role
		self.max_heart = _hp 
		self.max_health = _hp
		self.mana = 500 # Start at half-full for the first round
		self.action_speed = _spd
		self.special_move = _special

# --- REWARD DEFINITIONS ---

var loot_definitions = {
	"minion": RewardTable.new(100, 75, 0.1, [
		LootItem.new("Scraps of Bone", "Material", 20, "Common"),
		LootItem.new("Dull Iron Ore", "Material", 50, "Common")
	]),
	"boss": RewardTable.new(1000, 500, 0.4, [
		LootItem.new("Cursed Relic", "Relic", 500, "Rare"),
		LootItem.new("Soul Fragment", "Essence", 1000, "Legendary")
	])
}

# --- HERO ROSTER (The Chosen Ones) ---
var hero_list = []

func _init():
	# The Party (Roles: Tank, Mage, Defender, AOE_DD)
	# Speeds assigned based on your requested values (2.4s, 3.0s, 3.4s)
	hero_list.push(Entity.new("Elara", "Mage", 110, 2.4, "Star-Fall"))        # Fast & Heavy Magic
	hero_list.push(Entity.new("Korgath", "Tank", 350, 3.4, "Iron Bastion"))    # Slow & Unyielding
	hero_list.push(Entity.new("Silas", "Defender", 220, 3.0, "Guard's Vow"))   # Balanced Defense
	hero_list.push(Entity.new("Kaelen", "Mage", 130, 2.4, "Void Pulse"))       # Fast & Mysterious
	hero_list.push(Entity.new("Ignus", "AOE_DD", 190, 3.0, "Flameed Veil"))    # Balanced Offense

# --- ENEMY POPULATION (The Forgotten Woods) ---
var enemy_pool = []

func _init():
	# Hero definition is handled above in the script's scope or added here if needed
	# Re-calculating local logic for variety.
	
	# Minion Tier (Standard hurdles)
	enemy_pool.push(Entity.new("Shadow Wolf", "Minion", 80, 2.4))           # Agile threat
	enemy_pool.push(Entity.new("Grave Worm", "Minion", 50, 3.4))             # Slow but sturdy
	enemy_pool.push(Entity.new("Blighted Vine", "Minion", 70, 3.0))          # Ambient threat
	enemy_pool.push(Entity.new("Ghostly wisp", "Minion", 60, 2.4))           # Evasive spirit
	enemy_pool.push(Entity.new("Hollow Husk", "Minion", 120, 3.4))           # Undead husk

	# Boss Tier (Major obstacles)
	enemy_pool.push(Entity.new("The Weeping Willow", "Boss", 900, 3.4, "Sorrow's Root"))
	enemy_pool.push(Entity.new("Cursed Sentry", "Boss", 850, 3.2, "Shield of Woes"))
	enemy_pool.push(Entity.new("Void Shaper", "Boss", 1100, 3.4, "Dimensional Tear"))

# Logic to generate a random encounter for the world manager
func get_encounter():
	var chosen_minions = []
	# Standard logic: 1 Boss + (1 to 3) Minions
	boss_idx = randi() % 3 + 5 # Select from the last 3 entries in pool (the bosses)
	boss = enemy_pool[boss_idx]
	chosen_minions.append(boss)
	
	num_minions = rand_range(1, 4) # Can be 1, 2, or 3 minions
	for i in range(num_minions):
		# Select a random minion from indices 0-4
		m_idx = randi() % 5
		chosen_minions.append(enemy_pool[m_idx])
		
	return chosen_minions

var boss: Entity
var boss_idx: int
