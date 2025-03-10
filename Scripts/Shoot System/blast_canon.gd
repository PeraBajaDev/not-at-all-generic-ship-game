class_name BlastCanon
extends Node2D

@export var normal_bullet_scene: PackedScene
@export var shooterNode: Node
@export var damage: int
var bullet: Bullet
var bullet_scene: PackedScene = normal_bullet_scene
func _ready() -> void:
	shooterNode.shoot.connect(on_shoot)
func on_shoot():
	bullet = bullet_scene.instantiate()
	bullet.damage = damage
	bullet.position = self.global_position
	get_parent().add_sibling(bullet)

func change_on_power_up(new_bullet: PackedScene, seconds: int):
	bullet_scene = new_bullet
	await get_tree().create_timer(seconds)
	change_to_normal_bullet()

func change_to_normal_bullet():
	bullet_scene = normal_bullet_scene
