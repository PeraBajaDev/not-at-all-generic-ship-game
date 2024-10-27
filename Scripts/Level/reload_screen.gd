extends Button

func _ready() -> void:
	button_up.connect(on_button_up)

func on_button_up() -> void:
	get_tree().reload_current_scene()
