extends Bullet

@export var bulletScene: PackedScene  
const SPREAD_NUMBER = 2
const SPREAD_WAIT_TIME = 0.3

func _ready() -> void:
	await get_tree().create_timer(SPREAD_WAIT_TIME).timeout
	
	for i in range(-1, SPREAD_NUMBER):
		if not has_node('Movement'): return
		
		var newBullet = create_new_bullet(i)
		add_sibling(newBullet)
		
	self.queue_free()

func create_new_bullet(index):
	var newBullet: Bullet = bulletScene.instantiate()
	newBullet.damage = damage / 2
	set_new_bullet_position(newBullet)
	set_new_bullet_movement(newBullet.get_node('Movement'), index)
	return newBullet

func set_new_bullet_movement(newBulletMovement: BaseMovement, yDirection):
		newBulletMovement.direction.y = yDirection
		newBulletMovement.rotate(deg_to_rad(35 * yDirection))

func set_new_bullet_position(newBullet: Bullet):
	var movement_node: Node2D = get_node('Movement')
	newBullet.position = movement_node.global_position
