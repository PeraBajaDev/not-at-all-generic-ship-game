extends Node

@export var playerStats: PlayerStats
@onready var player = get_parent()

func _ready() -> void:
	playerStats.maxHealth = $"../HealthComponent".maxHealth 
	playerStats.health = $"../HealthComponent".health 
	playerStats.damage = $"../BlastCanon".damage 
	playerStats.rechargeSpeed = $"../InputHandler".recoil 

func _process(_delta: float) -> void:
	$"../HealthComponent".health = playerStats.health
	$"../HealthComponent".maxHealth = playerStats.maxHealth
	$"../BlastCanon".damage = playerStats.damage
	$"../InputHandler".recoil = playerStats.rechargeSpeed
	playerStats.position = playerStats.position
func _exit_tree() -> void:
	playerStats.died.emit()
