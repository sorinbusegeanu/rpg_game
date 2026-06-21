extends Node

# The World Manager handles the exploration state and transition logic.
# It manages movement, hazards (Thickens/Miasms), and the fade-to-black timer.

var current_position = 0.0
var base_speed = 15.0
var transition_timer = 0.0 # The 5-second countdown
var is_transitioning = false

func _init():
	pass

# Main loop for world interaction
func update_world(delta: float):
	if not is_transitioning:
		current_position += base_speed * delta
		process_hazards()
		check_for_encounters()
    
	if is_transitioning:
		transition_timer -= delta
		if transition_timer <= 0:
			# Transition finished, trigger change in state manager
			pass

func process_hazards():
	# Logic for Thickens (slowing) and Miasms (AOE impact)
	if current_position > 100 and current_position < 250:
		# Example: reduce speed in thick ground
		pass

func check_for_encounters():
	# Random chance logic for encountering monsters.
	# If triggered, set is_transitioning = true and start timer at 5.0.
	pass

# Start the 5-second fade to black before combat begins
func initiate_fade_sequence():
	print("Initiating Fade Sequence...")
	is_transitioning = true
	transition_timer = 5.0
fi

# Rewards are calculated based on enemy weight
func calculate_reward(enemy_type: String) -> Dictionary:
	if enemy_type == "Boss":
		return {"gold": 500, "xp": 250}
	else:
		return {"gold": 100, "xp": 50}
fi
