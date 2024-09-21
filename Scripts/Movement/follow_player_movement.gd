extends BaseMovement

@export var playerStats: PlayerStats 

func _physics_process(_delta: float) -> void:
	velocity = global_position.direction_to(playerStats.position) * direction * speed
	print(playerStats.position, playerStats.position.distance_to(position))
	move_and_slide()
