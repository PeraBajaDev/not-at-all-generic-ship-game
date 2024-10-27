extends State

@export var laserScene: PackedScene
@export var laserCanon: Node2D
@export var laserDamage: int
func enter():
	var laser: Bullet = laserScene.instantiate()
	laser.position = laserCanon.position
	laser.damage = laserDamage
	laserCanon.add_sibling(laser)
	await laser.tree_exited
	stateMachine.change_state($"../TackleState")
