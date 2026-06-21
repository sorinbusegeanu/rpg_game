extends Control

# Logic Components
var controller
var auto_running: bool = false
var auto_step_seconds: float = 0.5
var auto_step_accumulator: float = 0.0
var log_lines: Array[String] = []

# UI Node References
var state_label: Label
var position_label: Label
var timer_label: Label
var hero_list: RichTextLabel
var enemy_list: RichTextLabel
var log_list: RichTextLabel
var advance_button: Button
var auto_button: Button
var stop_button: Button

func _ready():
    # 1. Link UI components from the scene tree
    state_label = $RootLayout/TopStats/StateLabel
    position_label = $RootLayout/TopStats/PositionLabel
    timer_label = $RootLayout/TopStats/TimerLabel
    hero_list = $RootLayout/MainColumns/HeroPanel/HeroList
    enemy_list = $RootLayout/MainColumns/EnemyPanel/EnemyList
    log_list = $RootLayout/MainColumns/LogPanel/LogList
    advance_button = $RootLayout/Buttons/AdvanceButton
    auto_button = $RootLayout/Buttons/AutoButton
    stop_button = $RootLayout/Buttons/StopButton

    # 2. Initialize the core controller
    controller = load("res://scripts/game_controller.gd").new()
    add_child(controller)

    # 3. Connect interaction buttons
    advance_button.pressed.connect(_on_advance_pressed)
    auto_button.pressed.connect(_on_auto_pressed)
    stop_button.pressed.connect(_on_stop_pressed)

    add_log("System Initialized.")
    refresh_ui()

func _process(delta):
    if auto_running:
        auto_step_accumulator += delta
        if auto_step_accumulator >= auto_step_seconds:
            auto_step_accumulator = 0.0
            _on_advance_pressed() # Trigger a single step manually
    refresh_ui()

func _on_advance_pressed():
    # Directly call the controller's main logic loop update
    # Since game_controller handles its own processing but we want an instant jump:
    if controller.has_method("process"):
        controller.process()
    add_log("Step Advancing...")
    refresh_ui()

func _on_auto_pressed():
    auto_running = true
    add_log("Auto-mode Enabled")

func _on_stop_pressed():
    auto_running = false
    add_log("Auto-mode Disabled")

func refresh_ui():
    if not controller: return

    # Update Primary Metrics
    state_label.text = "Status: " + (controller.get_state_name() if controller.has_method("get_state_name") else str(controller.state_manager.current_state))
    position_label.text = "Distance: " + str(10) # Placeholder or use controller logic
    # For now, let's just pull the raw values from the manager components
    try_update_metrics()

    # Update Hero List
    var heroes = []
    if controller.game_data != null:
        heroes = controller.game_data.get_heroes()
    
    hero_list.text = ""
    for h in heroes:
        hero_list.append_text(h.name + " | " + h.role + " | HP: " + str(h.heart) + "/" + str(h.max_heart) + " | Mana: " + str(h.mana) + "\n")

    # Update Enemy List
    if controller.current_enemy == null:
        enemy_list.text = "No active enemies"
    else:
        enemy_list.text = ""
        for e in controller.current_enemies:
            enemy_list.append_text(e.name + " | " + e.role + " | HP: " + str(e.heart) + "/" + str(e.max_heart) + "\n")

    # Update Logs
    log_list.text = ""
    for log in log_lines[-20:]:
        log_list.append_text(log + "\n")

func try_update_metrics():
    # Attempt to update from various components safely
    if controller.world_manager != null:
        position_label.text = "Distance: " + str(controller.world_manager.distance) + "m"
        timer_label.text = "Timer: " + str(max(0, controller.world_manager.timer)) + "s | Heartbeat: " + str(controller.world_manager.heart_time)
    
    if controller.state_manager != null:
         # logic for state name or current value
         pass

func add_log(msg):
    var timestamp = "" # Can add clock time later if needed
    log_lines.append(msg)
    # We don't update the text here to avoid heavy calculations in every sub-step, 
    # refresh_ui handles that at next tick or button press.
