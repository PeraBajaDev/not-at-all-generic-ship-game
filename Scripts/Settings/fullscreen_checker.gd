extends CheckBox

@onready var window = get_window()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_pressed = window.mode == Window.MODE_EXCLUSIVE_FULLSCREEN
	toggled.connect(on_button_pressed)

func on_button_pressed(checked: bool): 
	if checked:
		window.mode = Window.MODE_EXCLUSIVE_FULLSCREEN
	else:
		window.mode = Window.MODE_WINDOWED
