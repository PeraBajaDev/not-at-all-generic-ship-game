extends PanelContainer

@onready var close_button: Button = $HBoxContainer/Close
func _ready() -> void:
	close_button.button_up.connect(on_press_close_button)

func on_press_close_button():
	self.visible = false
	get_tree().paused = false
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		self.visible = !visible
		get_tree().paused = !get_tree().paused
