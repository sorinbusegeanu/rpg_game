extends Node

# Enum for the possible game states
enum State { EXPLORATION, TRANSITION, COMBAT }

# The current state of the game
var current_state = State.EXPLORATION

# Signal to notify other systems of a state change
signal state_changed(new_state)

func _ready():
    # Initialize the system
    print("Game State System Initialized. Current State: ", State.EXPLORATION)

# Function to switch states
func change_state(new_state: int):
    if current_state == new_state:
        return
    
    current_state = new_state
    state_changed.emit(current_state)
    print("State Changed to: ", current_state)

# Helper functions for clarity
func is_exploration() -> bool:
    return current_state == State.EXPLORATION

func is_transition() -> bool:
    return current_state == State.TRANSITION

func is_combat() -> bool:
    return current_state == State.COMBAT
