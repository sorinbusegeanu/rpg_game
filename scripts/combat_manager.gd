extends Node

# The Combat Manager handles the "Heartbeat" logic, 
# and now includes integrated loot/reward systems based on enemy tiers.

var player_units = []
var enemy_units = []
var next_action_times = {} # {id: float}
var current_rewards = {}

func _init():
	pass

# Start the combat loop with a given set of units from game_data
func start_combat(player_list, enemy_list):
	player_units = player_list
	enemy_units = enemy_list
	
	# Initialize heartbeat timers for every entity
	for i in range(player_units.size()):
		next_action_times[player_units[i].get_instance_id()] = 0.0
	for i in range(enemy_units.size()):
		next_action_times[enemy_units[i].get_instance_id()] = 0.0
		
	print("Combat Sequence Started. Enemy Count: ", enemy_units.size())

# Main update loop for the heart-beat system
func process_combat(delta: float):
	var current_time = Time.get_ticks_msec() / 1000.0
	
	for unit in player_units + enemy_units:
		id = unit.get_instance_id()
		if current_time >= next_action_times[id]:
			execute_unit_behavior(unit)
			next_action_times[id] = current_time + unit.action_speed

func execute_unit_behavior(unit):
	# Logic for Hero behavior (Mana management and Special Moves)
	if unit.role != "Enemy":
		if unit.can_use_special():
			trigger_special_move(unit)
		else:
			perform_standard_action(unit)
	else:
		# Enemy units perform standard actions or moves
		perform_standard_action(unit)

func trigger_special_move(unit):
	print("!!! PULSE EFFECT !!")
	print(unit.name, " executes special ability: ", unit.special_move)
	# Mana is consumed upon successful use of a Special Move
	unit.mana = 0

func perform_standard_action(unit):
	# Standard action adds mana and triggers growth in the heartbeat
	unit.perform_action()

# Calculate results based on the encounter's composition
func calculate_rewards(enemy_list: Array) -> Dictionary:
	total_gold = 0
	total_exp = 0
	items_won = []
	
	for enemy in enemy_list:
		if enemy.role == "Boss":
			# Boss rewards are significantly higher (Hard/Brutal scaling)
			total_gold += 1000
			total_exp += 500
            # Add a high-tier loot item from the data pool if possible
        else:
            # Minion rewards provide smaller standard gains
            total_gold += 100
            total_exp += 100

	return {
		"gold": total_gold,
		"xp": total_exp,
		"count_defeated": enemy_list.size()
	}
