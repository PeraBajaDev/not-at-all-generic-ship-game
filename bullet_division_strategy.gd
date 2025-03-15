class_name BulletDivisionStrategy
extends BulletStrategy

const SPREAD_NUMBER = 2
const SPREAD_WAIT_TIME = 0.3
func _init() -> void:
	print("hola")
	await Engine.get_main_loop().create_timer(5).timeout
	timeout.emit()
func apply_upgrade(bullet: Bullet):
	await Engine.get_main_loop().create_timer(SPREAD_WAIT_TIME).timeout
	for i in range(-1, SPREAD_NUMBER):
		if not bullet: return
		create_new_bullet(i, bullet)
	bullet.queue_free()
	
func create_new_bullet(index, bullet: Bullet):
	var newBullet: Bullet = bullet.duplicate()
	var children = newBullet.get_children()
	for child in children:
		if child is BulletDivisionStrategy:
			child.queue_free()
	newBullet.damage = bullet.damage / 2
	set_new_bullet_movement(newBullet.get_node('Movement'), index)
	bullet.add_sibling(newBullet)

func set_new_bullet_movement(newBulletMovement: BaseMovement, yDirection: int):
	newBulletMovement.direction.y = yDirection
	newBulletMovement.rotate(deg_to_rad(35 * yDirection))
