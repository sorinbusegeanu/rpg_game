extends Node

class LootItem:
    var name: String
    var type: String
    var value: int
    var rarity: String

    func _init(_name: String, _type: String, _value: int, _rarity: String):
        name = _name
        type = _type
        value = _value
        rarity = _rarity

class RewardTable:
    var gold_base: int
    var exp_reward: int
    var special_drop_chance: float
    var loot_pool: Array

    func _init(_gold_base: int, _exp_reward: int, _special_drop_chance: float, _loot_pool: Array):
        gold_base = _gold_base
        exp_reward = _exp_reward
        special_drop_chance = _special_drop_chance
        loot_pool = _loot_pool

class Entity:
    var name: String
    var role: String
    var health: float
    var max_health: float
    var max_heart: float
    var mana: float
    var action_speed: float
    var special_move: String

    func _init(_name: String, _role: String, _hp: float, _spd: float, _special: String = "None"):
        name = _name
        role = _role
        health = _hp
        max_health = _hp
        max_heart = _hp
        mana = 500
        action_speed = _spd
        special_move = _special

    func add_mana(amount: float):
        mana = clamp(mana + amount, 0.0, 1000.0)

    func can_use_special() -> bool:
        return mana >= 1000.0

    func perform_action():
        add_mana(100)
        print(name, " performed an action. Mana: ", mana)

    func receive_hit(damage: float):
        health = max(0.0, health - damage)
        if role not in ["Minion", "Boss", "Enemy"]:
            add_mana(200)

    func is_alive() -> bool:
        return health > 0.0

    func reset_for_combat():
        health = max_health
        mana = clamp(mana, 0.0, 1000.0)

var loot_definitions = {}
var hero_list = []
var enemy_pool = []

func _init():
    init_rewards()
    init_heroes()
    init_enemies()

func init_rewards():
    loot_definitions = {
        "minion": RewardTable.new(100, 75, 0.1, [
            LootItem.new("Scraps of Bone", "Material", 20, "Common"),
            LootItem.new("Dull Iron Ore", "Material", 50, "Common")
        ]),
        "boss": RewardTable.new(1000, 500, 0.4, [
            LootItem.new("Cursed Relic", "Relic", 500, "Rare"),
            LootItem.new("Soul Fragment", "Essence", 1000, "Legendary")
        ])
    }

func init_heroes():
    hero_list.clear()
    hero_list.append(Entity.new("Elara", "Mage", 110, 2.4, "Star-Fall"))
    hero_list.append(Entity.new("Korgath", "Tank", 350, 3.4, "Iron Bastion"))
    hero_list.append(Entity.new("Silas", "Defender", 220, 3.0, "Guard's Vow"))
    hero_list.append(Entity.new("Kaelen", "Mage", 130, 2.4, "Void Pulse"))
    hero_list.append(Entity.new("Ignus", "AOE_DD", 190, 3.0, "Flame Veil"))

func init_enemies():
    enemy_pool.clear()
    enemy_pool.append(Entity.new("Shadow Wolf", "Minion", 80, 2.4))
    enemy_pool.append(Entity.new("Grave Worm", "Minion", 50, 3.4))
    enemy_pool.append(Entity.new("Blighted Vine", "Minion", 70, 3.0))
    enemy_pool.append(Entity.new("Ghostly Wisp", "Minion", 60, 2.4))
    enemy_pool.append(Entity.new("Hollow Husk", "Minion", 120, 3.4))
    enemy_pool.append(Entity.new("The Weeping Willow", "Boss", 900, 3.4, "Sorrow's Root"))
    enemy_pool.append(Entity.new("Cursed Sentry", "Boss", 850, 3.2, "Shield of Woes"))
    enemy_pool.append(Entity.new("Void Shaper", "Boss", 1100, 3.4, "Dimensional Tear"))

func get_heroes() -> Array:
    return hero_list

func get_encounter() -> Array:
    var encounter = []
    var boss_index = randi_range(5, 7)
    encounter.append(enemy_pool[boss_index])
    var minion_count = randi_range(1, 3)
    for i in range(minion_count):
        var minion_index = randi_range(0, 4)
        encounter.append(enemy_pool[minion_index])
    return encounter
