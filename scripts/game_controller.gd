extends Node

# The GameController is the main entry point and sequencer.
# It manages the flow of information between data, logic, and UI.

var state_manager
var world_manager
var combat_manager
var ui_manager

func _init():
	state_manager = load("res://scripts/states.gd").new()
	world_manager = load("res://scripts/world_manager.gd").new()
	combat_manager = load("res://scripts/combat_manager.gd").new()
	ui_manager = load("res://scripts/ui_manager.gd").new()

func _ready():
	print("Game Controller active.")
	state_manager.change_state(0) # Start in Exploration

func _process(delta: float):
	if state_manager.is_exploration():
		world_manager.update_world(delta)
		# If world logic detects a challenge, transition to combat via the manager
		
	elif state_manager.is_transition():
		# Handle visual fade-out of the forest and fade-in of the battleground
		pass
	
	elif state_manager.is_combat():
		# Core Combat Logic loop
		combat_manager.process_combat(delta)
		# UI update happens concurrently with combat logic
		# In a real game, we'd pass the current hero list to the ui_manager
		update_ui_cards()

func update_ui_cards():
	# This would pull from the data manager (or directly from variables)
	pass

func on_special_triggered(hero_name: String):
	# When combat_manager triggers a special, it notifies UI to show pulse.
	ui_manager.trigger_pulse(hero_name)
fi
