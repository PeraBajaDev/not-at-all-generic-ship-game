class_name BlastCanon
extends Node2D

@export var bullet_scene: PackedScene
@export var shooterNode: Node
@export var damage: int

func _ready() -> void:
	shooterNode.shoot.connect(on_shoot)

func on_shoot():
	var bullet: Node = bullet_scene.instantiate()
	bullet.damage = damage
	bullet.position = self.global_position
	get_parent().add_sibling(bullet)
