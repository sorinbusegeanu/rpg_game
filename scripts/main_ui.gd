extends Control

var controller
var auto_running: bool = false
var auto_step_seconds: float = 0.5
var auto_step_accumulator: float = 0.0
var log_lines: Array[String] = []

@onready var state_label: Label = $RootLayout/TopStats/StateLabel
@onready var position_label: Label = $RootLayout/TopStats/PositionLabel
@onready var timer_label: Label = $RootLayout/TopStats/TimerLabel
@onready var hero_list: RichTextLabel = $RootLayout/MainColumns/HeroPanel/HeroList
@onready var enemy_list: RichTextLabel = $RootLayout/MainColumns/EnemyPanel/EnemyList
@onready var log_list: RichTextLabel = $RootLayout/MainColumns/LogPanel/LogList
@onready var advance_button: Button = $RootLayout/Buttons/AdvanceButton
@onready var auto_button: Button = $RootLayout/Buttons/AutoButton
@onready var stop_button: Button = $RootLayout/Buttons/StopButton

func _ready():
    controller = load("res://scripts/game_controller.gd").new()
    add_child(controller)

    advance_button.pressed.connect(_on_advance_pressed)
    auto_button.pressed.connect(_on_auto_pressed)
    stop_button.pressed.connect(_on_stop_pressed)

    add_log("System initialized.")
    refresh_ui()

func _process(delta: float):
    if auto_running:
        auto_step_accumulator += delta
        if auto_step_accumulator >= auto_step_seconds:
            auto_step_accumulator = 0.0
            advance_one_step()
    refresh_ui()

func _on_advance_pressed():
    advance_one_step()

func _on_auto_pressed():
    auto_running = true
    add_log("Auto mode started.")

func _on_stop_pressed():
    auto_running = false
    add_log("Auto mode stopped.")

func advance_one_step():
    if controller != null and controller.has_method("process_step"):
        controller.process_step(auto_step_seconds)
        add_log("Step: " + controller.get_state_name() + " at " + str(round(controller.get_position())) + "m")
    refresh_ui()

func refresh_ui():
    if controller == null:
        return

    state_label.text = "Status: " + controller.get_state_name()
    position_label.text = "Distance: " + str(round(controller.get_position())) + "m"
    timer_label.text = "Timer: " + str(snapped(controller.get_transition_timer(), 0.1)) + "s"

    hero_list.clear()
    for h in controller.get_heroes():
        hero_list.append_text(
            h.name + " | " + h.role +
            " | HP: " + str(h.health) + "/" + str(h.max_heart if "max_heart" in h else h.max_health) +
            " | Mana: " + str(h.mana) + "/1000" +
            " | Speed: " + str(h.action_speed) + "\n"
        )

    enemy_list.clear()
    var enemies = controller.get_enemies()
    if enemies.is_empty():
        enemy_list.append_text("No active encounter\n")
    else:
        for e in enemies:
            enemy_list.append_text(
                e.name + " | " + e.role +
                " | HP: " + str(e.health) + "/" + str(e.max_heart if "max_heart" in e else e.max_heart) +
                " | Mana: " + str(e.mana) + "/1000" +
                " | Speed: " + str(e.action_speed) + "\n"
            )

    log_list.clear()
    var start_index = max(0, log_lines.size() - 30)
    for i in range(start_index, log_lines.size()):
        log_list.append_text(log_lines[i] + "\n")

func add_log(message: String):
    log_lines.append(message)
    if log_lines.size() > 100:
        log_lines.remove_at(0)
