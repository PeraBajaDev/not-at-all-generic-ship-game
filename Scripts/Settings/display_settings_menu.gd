extends PanelContainer

@onready var close_button: Button = $HBoxContainer/Close
func _ready() -> void:
	close_button.button_up.connect(on_press_close_button)

func on_press_close_button():
	self.visible = false
	get_tree().paused = false
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("open_menu"):
		self.visible = !visible
		get_tree().paused = !get_tree().paused
