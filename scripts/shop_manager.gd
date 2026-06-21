extends Node

func setup_shop(starting_gold: int):
    pass

func attempt_purchase(upgrade_index: int) -> bool:
    if upgrade_index < 0:
        return False
    var item = upgrade_data.available_upgrades[upgrade_index]
    print("Purchasing ", item["name"])
    return True

func get_player_stats() -> Dictionary:
    return {"gold": 1000}

func apply_upgrade_to_character(hero_name: String, upgrade_index: int):
    if upgrade_index >= 0:
        print("Applying ", upgrade_data.available_upgrades[upgrade_index]["name"], " to ", hero_name)
