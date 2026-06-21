extends Node

# Define the data structure for a character (Hero or Enemy)
# This ensures all characters have consistent properties based on our GDD.
class Entity:
	var name: String
	var role: String        # Tank, Mage, Defender, AOE_DD
	var health: float
	var max_health: float
	var mana: float         # Current Mana (Cap at 1000)
	var action_speed: float # seconds between actions (2.4, 3.0, or 3.4)
	var special_move: String
	var gold_reward: int = 0

	func _init(_name: String, _role: String, _health: float, _action_speed: float, _special_move: String = "None"):
		self.name = name
		self.role = role
		self.max_health = health
		self.health = health
		self.mana = 0 # Starts at 0 or a base amount (e.g., 500 as per previous designs)
		self.action_speed = action_speed
		self.special_move = special_move

	# Logic for mana calculation based on our rules:
	# Hit received: +200, Action performed: +100
	func add_mana(amount: float):
		self.mana += amount
		if self.mana > 1000:
			self.mana = 1000

	func can_use_special() -> bool:
		return self.mana >= 1000

	func perform_action():
		# Logic for regular action (adds mana)
		self.add_mana(100)
		print(name, " performed an action. Mana is now ", self.mana)

	func receive_hit(damage: float):
		self.health -= damage
		# A hit adds 200 mana to the entity (if it's a player hero)
		if self.role != "Enemy":
			self.add_mana(200)
		print(name, " took ", damage, " damage. Health: ", self.health, " Mana: ", self.mana)
