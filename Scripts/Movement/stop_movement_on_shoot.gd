extends Node


func _ready() -> void:
	$"../ShootingBehavior".shoot.connect(on_shoot)

func on_shoot():
	get_parent().direction = Vector2.ZERO
