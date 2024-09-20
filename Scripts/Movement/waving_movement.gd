extends BaseMovement

@export var wavefactor = 2
var time = 2

func _physics_process(_delta: float) -> void:
	time += 2
	
	velocity.y = sin(deg_to_rad(time)) * wavefactor
	move_and_slide()
