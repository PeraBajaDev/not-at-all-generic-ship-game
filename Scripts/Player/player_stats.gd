class_name PlayerStats
extends Resource

signal died

var health: int:
	set(value):
		health = value if value <= maxHealth else maxHealth
var maxHealth: int:
	set(value):
		maxHealth = value if value <= 20 else 20
var damage: int
var bullet: Bullet
var rechargeSpeed: float:
	set(value):
		rechargeSpeed = value if value >= 0.3 else 0.3
var position: Vector2
