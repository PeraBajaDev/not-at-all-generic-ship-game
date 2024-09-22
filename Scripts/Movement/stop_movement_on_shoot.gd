extends Node


func _ready() -> void:
	if has_node("../ShootingBehavior"):
		$"../ShootingBehavior".shoot.connect(on_shoot)

func on_shoot():
	get_parent().direction = Vector2.ZERO
