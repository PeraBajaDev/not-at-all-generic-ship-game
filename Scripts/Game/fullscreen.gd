extends Node
var window

func _process(_delta: float) -> void:
	 
	if Input.is_key_pressed(KEY_F11):
		window = get_window()
		if window.mode != Window.Mode.MODE_EXCLUSIVE_FULLSCREEN:
			window.set_mode(Window.MODE_EXCLUSIVE_FULLSCREEN)
		else:
			window.set_mode(Window.Mode.MODE_MINIMIZED)
