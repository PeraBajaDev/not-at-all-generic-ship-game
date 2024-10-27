extends Button

@export var scene: PackedScene

func _ready() -> void:
	button_up.connect(change_to_scene)
	
func change_to_scene():
	get_tree().change_scene_to_packed(scene)
