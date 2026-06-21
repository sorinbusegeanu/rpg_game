extends Node

# The Shop UI Manager handles all visual interactions and feedback 
# related to the shopping experience in the Castle Hub.

var shop_manager = load("res://scripts/shop_manager.gd").new()

# Reference to the shop inventory
var items = []

func _init():
	pass

# Initializes the UI for the shop.
# This would be called when the player clicks the "Shop" icon in the Castle Hub.
func initialize_shop_ui(initial_gold: int):
	shop_manager.setup_shop(initial_gold)
	refresh_shop_display()

# Refreshes and renders the list of available upgrades as a grid or list of cards.
# Each "card" will display name, cost, and effect.
func refresh_shop_display():
	print("Refreshing Shop UI...")
	# This iterates through shop_manager's items and prepares them for display.
	for i in range(10): # Max length of the upgrade list
		# Construct a card representation for the front-end
		pass

# Feedback for purchase success or failure.
func show_purchase_feedback(success: bool, message: String):
	if success:
		print("SUCCESS: " + message)
		# Trigger green highlight/pulse on shop button
    else:
        print("FAILURE: " + message)
        # Trigger red shake effect on the selection item

# Logic to update the gold counter in the top-right corner.
func update_gold_display(current_amount: int):
	# This would find the label and set its text.
	print("Updating Gold Display to: ", current_amount)

# Selection logic. When a player clicks on an item card.
func select_shop_item(index: int):
	result = shop_manager.attempt_purchase(index)
	if result:
        # Use the feedback system for success
        show_purchase_feedback(True, "Purchased successfully!")
    else:
        # Use the feedback system for failure (e.g., not enough gold)
        show_purchase_feedback(False, "Insufficient funds.")
    
    # Update display after purchase
    new_gold = shop_manager.get_player_stats()["gold"]
    update_gold_display(new_gold)

# Internal variables for state tracking
var result: bool
var new_gold: int
