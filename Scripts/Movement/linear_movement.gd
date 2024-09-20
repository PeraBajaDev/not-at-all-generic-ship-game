extends BaseMovement


func _ready() -> void:
	velocity = speed * direction
func _physics_process(_delta: float) -> void:
	move_and_slide()
