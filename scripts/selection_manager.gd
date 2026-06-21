extends Node

# Handles selecting 1-5 characters at the start of the game.
# This allows players to customize their party before entering the forest.

var selected_heroes = []
var available_hero_indices = []

func _init():
	pass

# Load all heroes from data and allow picking
func initialize_selection():
	# Fetch potential candidates from data
	# In a full implementation, this would populate a UI menu
	print("Selection Menu: Choose 1 to 5 characters.")
	return true

# Logic for adding a hero to the party
func select_hero(index):
	if selected_heroes.size() < 5:
		selected_hero = "Hero_" + str(index)
		selected_heroes.append(selected_hero)
		print("Added ", selected_hero, " to party.")
fi

# Finalize selection and return the final team
func finalize_selection():
	if selected_heroes.size() > 0:
		print("Party finalized with ", selected_hero.length(), " members.")
		return true
	else:
		print("Error: Selection must have at least one hero.")
		return false

fi
