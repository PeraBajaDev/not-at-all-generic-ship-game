extends Bullet

@export var bulletScene: PackedScene  
var spreadNumber = 2
func _ready() -> void:
	await get_tree().create_timer(0.3).timeout
	
	for n in range(-1, spreadNumber):
		var newBullet: Bullet = bulletScene.instantiate()
		
		
		if not get_node('Movement'): return
		var movement: Node2D = get_node('Movement')
		newBullet.position = movement.global_position
		newBullet.damage = roundi(damage / 2)
		var newBulletMovement: BaseMovement = newBullet.get_node('Movement')
		newBulletMovement.direction.y = n
		newBulletMovement.rotate(deg_to_rad(35 * n))
		add_sibling(newBullet)
	queue_free()
