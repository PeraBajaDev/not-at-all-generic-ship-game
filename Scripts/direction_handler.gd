extends Node

signal direction_changed(direction)

func _process(_delta: float) -> void:
	direction_changed.emit(get_parent().velocity.normalized())
