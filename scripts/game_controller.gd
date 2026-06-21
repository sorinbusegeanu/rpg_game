extends Node

var state_manager
var world_manager
var combat_manager
var game_data
var current_enemies: Array = []

func _ready():
    print("Game Controller active.")

func _init():
    game_data = load("res://scripts/game_data.gd").new()
    state_manager = load("res://scripts/states.gd").new()
    world_manager = load("res://scripts/world_manager.gd").new()
    combat_manager = load("res://scripts/combat_manager.gd").new()

    add_child(state_manager)
    add_child(world_manager)
    add_child(combat_manager)
    add_child(game_data)

    world_manager.setup(game_data)
    world_manager.encounter_detected.connect(_on_encounter_detected)
    world_manager.transition_finished.connect(_on_transition_finished)
    combat_manager.special_triggered.connect(_on_special_triggered)
    combat_manager.combat_finished.connect(_on_combat_finished)

    state_manager.change_state(state_manager.State.EXPLORATION)

func process_step(delta: float):
    if state_manager.is_exploration():
        world_manager.update_world(delta)
    elif state_manager.is_transition():
        world_manager.update_world(delta)
    elif state_manager.is_combat():
        combat_manager.process_combat(delta)

func _on_encounter_detected(enemy_list: Array):
    current_enemies = enemy_list
    state_manager.change_state(state_manager.State.TRANSITION)

func _on_transition_finished():
    state_manager.change_state(state_manager.State.COMBAT)
    combat_manager.start_combat(game_data.get_heroes(), current_enemies)

func _on_special_triggered(unit):
    print("Special triggered: ", unit.name)

func _on_combat_finished(rewards: Dictionary):
    print("Combat finished. Rewards: ", rewards)
    current_enemies.clear()
    state_manager.change_state(state_manager.State.EXPLORATION)

func get_state_name() -> String:
    return state_manager.get_state_name()

func get_position() -> float:
    return world_manager.current_position

func get_transition_timer() -> float:
    return world_manager.transition_timer

func get_heroes() -> Array:
    return game_data.get_heroes()

func get_enemies() -> Array:
    return current_enemies
