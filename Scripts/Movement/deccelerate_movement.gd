extends BaseMovement

@export var friction: float
var time = 0
	
func _physics_process(delta: float) -> void:
	time += friction * delta
	velocity.x = move_toward(velocity.x, 0, time)
	move_and_slide()
