extends Node

enum State { EXPLORATION, TRANSITION, COMBAT }

var current_state = State.EXPLORATION

func change_state(new_state):
    current_state = new_state
    # Emit state_changed signal if it were defined in a node context
    pass

func is_exploration():
    return current_state == State.EXPLORATION

func is_transition():
    return current_state == State.TRANSITION

func is_combat():
    return current_state == State.COMBAT

func get_state_name() -> String:
    match current_state:
        State.EXPLORATION:
            return "EXPLORATION"
        State.TRANSITION:
            return "TRANSITION"
        State.COMBAT:
            return "COMBAT"
        _:
            return "UNKNOWN"
