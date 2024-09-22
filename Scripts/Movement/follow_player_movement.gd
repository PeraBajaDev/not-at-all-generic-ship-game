extends BaseMovement

@export var playerStats: PlayerStats 

func _physics_process(_delta: float) -> void:
	velocity = global_position.direction_to(playerStats.position) * direction * speed
	move_and_slide()
