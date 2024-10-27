extends Button



func _ready() -> void:
	button_down.connect(display_settings_menu)

func display_settings_menu():
	$"../../../SettingsMenu".show()
	get_tree().paused = true
