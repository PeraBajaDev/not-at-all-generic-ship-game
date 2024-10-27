extends Control
	
@export var level: PackedScene
func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(level)

func _on_exit_pressed() -> void:
	get_tree().quit()
