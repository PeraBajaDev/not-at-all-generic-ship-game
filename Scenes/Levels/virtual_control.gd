extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if OS.get_name() == "Android":
		visible = true
	else: visible = false
