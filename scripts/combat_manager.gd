extends Node

signal combat_finished(rewards)
signal unit_acted(unit)
signal special_triggered(unit)

var player_units: Array = []
var enemy_units: Array = []
var next_action_times: Dictionary = {}
var current_rewards: Dictionary = {}
var combat_active: bool = false

func start_combat(player_list: Array, enemy_list: Array):
    player_units = player_list
    enemy_units = enemy_list
    next_action_times.clear()
    combat_active = true

    var current_time = Time.get_ticks_msec() / 1000.0
    for unit in player_units + enemy_units:
        next_action_times[unit.get_instance_id()] = current_time + unit.action_speed

    print("Combat Sequence Started. Enemy Count: ", enemy_units.size())

func process_combat(delta: float):
    if not combat_active:
        return

    var current_time = Time.get_ticks_msec() / 1000.0
    for unit in player_units + enemy_units:
        if unit.has_method("is_alive") and not unit.is_alive():
            continue

        var id = unit.get_instance_id()
        if not next_action_times.has(id):
            next_action_times[id] = current_time + unit.action_speed

        if current_time >= next_action_times[id]:
            execute_unit_behavior(unit)
            next_action_times[id] = current_time + unit.action_speed

func is_player_unit(unit) -> bool:
    return unit.role not in ["Minion", "Boss", "Enemy"]

func execute_unit_behavior(unit):
    if is_player_unit(unit):
        if unit.has_method("can_use_special") and unit.can_use_special():
            trigger_special_move(unit)
        else:
            perform_standard_action(unit)
    else:
        perform_standard_action(unit)

func trigger_special_move(unit):
    print("!!! PULSE EFFECT !!")
    print(unit.name, " executes special ability: ", unit.special_move)
    unit.mana = 0
    emit_signal("special_triggered", unit)

func perform_standard_action(unit):
    if unit.has_method("perform_action"):
        unit.perform_action()
    emit_signal("unit_acted", unit)

func calculate_rewards(enemy_list: Array) -> Dictionary:
    var total_gold = 0
    var total_exp = 0

    for enemy in enemy_list:
        if enemy.role == "Boss":
            total_gold += 1000
            total_exp += 500
        else:
            total_gold += 100
            total_exp += 100

    return {
        "gold": total_gold,
        "xp": total_exp,
        "count_defeated": enemy_list.size()
    }
