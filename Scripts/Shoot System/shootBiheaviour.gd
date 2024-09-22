extends Node

signal shoot

func _ready() -> void:
	$Timer.timeout.connect(on_timeout)
	
func on_timeout(): 
	shoot.emit()
