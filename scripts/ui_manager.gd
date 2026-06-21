extends Node

func update_character_cards(hero_list: Array):
    # Loop through heroes and update UI components if they exist.
    for hero in hero_list:
        pass

func trigger_pulse_effect(hero_name: String):
    print("Pulse effect for: ", hero_name)

func update_shop_ui():
    pass

func format_currency(amount: int) -> String:
    return str(amount)
