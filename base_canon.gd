class_name BaseCanon
extends Node

@export var bullet_scene: PackedScene
@export var shooterNode: Node
@export var damage: int
var bullet: Bullet
var bullet_strategies : Array[BulletStrategy]
func _ready() -> void:
	shooterNode.shoot.connect(on_shoot)
func on_shoot():
	bullet = bullet_scene.instantiate()
	bullet.damage = damage
	bullet.position = self.global_position 
	for strategy in bullet_strategies:
		if not strategy.timeout.is_connected(func(): bullet_strategies.erase(strategy)):
			strategy.timeout.connect(func(): bullet_strategies.erase(strategy))
		if bullet:
			strategy.apply_upgrade(bullet)
	
