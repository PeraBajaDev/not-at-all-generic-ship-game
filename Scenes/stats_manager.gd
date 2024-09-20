extends Node

@export var playerStats: PlayerStats

func _process(_delta: float) -> void:
	playerStats.health = $"../HealthComponent".health
	playerStats.maxHealth = $"../HealthComponent".maxHealth
	playerStats.damage = $"../BlastCanon".damage
	playerStats.recharge_speed = $"../InputHandler".recoil

func _exit_tree() -> void:
	playerStats.died.emit()
