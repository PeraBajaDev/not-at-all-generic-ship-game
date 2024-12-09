extends Node

@onready var asteroid: BaseMovement = get_parent()
func _ready() -> void:
	asteroid.direction = Vector2(randi_range(-1, 1), 1)
	asteroid.speed = randi_range(20, 60)
