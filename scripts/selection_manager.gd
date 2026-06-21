extends Node

var selected_heroes: Array = []

func select_hero(index: int) -> bool:
    if selected_heroes.size() < 5:
        var name = "Hero_" + str(index)
        selected_heroes.append(name)
        print("Selected: ", name)
        return true
    return false

func finalize_selection() -> bool:
    if selected_heroes.size() > 0:
        print("Party finalized with ", selected_heroes.size(), " members.")
        return true
    else:
        print("Error: No heroes selected.")
        return false

func get_selected_heroes() -> Array:
    return selected_heroes
