extends Node

@onready var window = get_window()

func _process(_delta: float) -> void:
	if not Input.is_key_pressed(KEY_F11): return
	
	if window.mode != Window.Mode.MODE_EXCLUSIVE_FULLSCREEN:
		window.set_mode(Window.MODE_EXCLUSIVE_FULLSCREEN)
	else:
		window.set_mode(Window.Mode.MODE_WINDOWED)
