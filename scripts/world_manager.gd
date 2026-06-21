extends Node

signal encounter_detected(enemy_list)
signal transition_finished

var current_position: float = 0.0
var base_speed: float = 15.0
var transition_timer: float = 0.0
var is_transitioning: bool = false
var game_data = null
var encounter_interval: float = 50.0
var next_encounter_position: float = 50.0
var pending_encounter: Array = []

func setup(_game_data):
    game_data = _game_data

func update_world(delta: float):
    if not is_transitioning:
        current_position += base_speed * delta
        process_hazards()
        check_for_encounters()
    else:
        transition_timer -= delta
        if transition_timer <= 0.0:
            transition_timer = 0.0
            is_transitioning = false
            emit_signal("transition_finished")

func process_hazards():
    if current_position > 100.0 and current_position < 250.0:
        pass

func check_for_encounters():
    if game_data == null:
        return
    if current_position >= next_encounter_position and not is_transitioning:
        pending_encounter = game_data.get_encounter()
        next_encounter_position += encounter_interval
        initiate_fade_sequence()
        emit_signal("encounter_detected", pending_encounter)

func initiate_fade_sequence():
    print("Initiating Fade Sequence...")
    is_transitioning = true
    transition_timer = 5.0

func get_pending_encounter() -> Array:
    return pending_encounter
