extends Node

enum UpgradeType { HEALTH, DAMAGE, MANA_REGEN, SPEED }

class Upgrade:
    var name: String
    var type: int
    var cost: int
    var effect_value: float
    var description: String

    func _init(_name: String, _type: int, _cost: int, _effect_val: float, _desc: String):
        name = _name
        type = _type
        cost = _cost
        effect_value = _effect_val
        description = _desc

var available_upgrades: Array = []

func _init():
    # populate available_upgrades
    available_upgrades.append(Upgrade("Minor Heal", UpgradeType.HEALTH, 100, 50.0, "Increases max health by 50"))
    available_upgrades.append(Upgrade("Major Healing", UpgradeType.HEALTH, 500, 150.0, "Significantly boosts survival"))
    available_upgrades.append(Upgrade("Sharp Strike", UpgradeType.DAMAGE, 200, 15.0, "Increases damage output"))
    available_upgrades.append(Upgrade("Arcane Focus", UpgradeType.MANA_REGEN, 300, 100.0, "Improves mana recovery"))
    available_upgrades.append(Upgrade("Swift Step", UpgradeType.SPEED, 400, 0.2, "Improves action speed"))

func init_shop():
    pass
