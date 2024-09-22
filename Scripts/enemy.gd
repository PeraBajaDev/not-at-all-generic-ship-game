class_name Enemy

extends Node
signal direction_changed(direction)

@onready var enemy = get_parent()

func _process(_delta: float) -> void:
	direction_changed.emit(enemy.velocity.normalized())
