extends Node

# Core Engine References
var state_manager
var world_manager
var combat_manager
var game_data
var current_enemies = []

func _init():
    # Load and Initialize Sub-Modules
    # Since these are scripts, we instantiate them as objects.
    game_data = load("res://scripts/game_data.gd").new()
    state_manager = load("res://scripts/states.gd").new()
    world_manager = load("res://scripts/world_manager.gd").new()
    combat_manager = load("res://scripts/combat_manager.gd").new()

    # Hook up the logic flow
    world_manager.setup(game_data)
    
    # Logging state for debugging during startup
    print("Game Controller: Initialized")
    print("World Manager Status: ", world_manager)
    print("Combat Manager Status: ", combat_manager)

func process(delta):
    # This allows the UI or a ticker to advance the game world by delta time.
    if state_manager.is_exploration():
        world_manager.update_world(delta)
    elif state_manager.is_transition():
        world_manager.update_world(delta)
    elif state_manager.is_combat():
        combat_manager.process_combat(delta)

# Utility methods for the UI layer
func get_state_name() -> String:
    return state_manager.get_state_name()

func get_current_enemy_count() -> int:
    return current_enemies.size()
