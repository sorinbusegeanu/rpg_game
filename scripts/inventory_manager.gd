extends Node

enum ItemType { WEAPON, ARMOR, MATERIAL, CONSUMABLE }

class Item:
    var id: int
    var name: String
    var type: int
    var rarity: String
    var value: int
    var quantity: int

    func _init(_id: int, _name: String, _type: int, _rarity: String, _value: int, _quantity: int = 1):
        id = _id
        name = _name
        type = _type
        rarity = _rarity
        value = _value
        quantity = _quantity

var player_inventory: Array = []

func add_item(new_item: Item):
    player_inventory.append(new_item)

func remove_item(index: int) -> bool:
    if index >= 0 and index < player_inventory.size():
        player_inventory.remove_at(index)
        return true
    return false

func craft_item(recipe_name: String) -> bool:
    if recipe_name == "Steel Blade":
        # Check for ingredients (example logic)
        # Find enough iron ore... if successful, append and return true.
        pass
    return false

func sell_to_shop(item_index: int) -> int:
    if item_index >= 0 and item_index < player_inventory.size():
        var item = player_inventory[item_index]
        var val = item.value
        # Logic to remove from inventory...
        return val
    return 0
