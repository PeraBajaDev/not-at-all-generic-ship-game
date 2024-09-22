class_name HealthComponent
extends Node

@export var maxHealth: int
var health: int: 
	set(value):
		health = value if value >= 0 else 0

signal damaged
signal maxHealthIncremented
signal died

func _ready() -> void:
	health = maxHealth

func inscrease_max_health():
	maxHealth += 1
	maxHealthIncremented.emit()

func harm(value: int):
	health -= value
	damaged.emit()
	
	if health == 0: 
		died.emit()
		return
