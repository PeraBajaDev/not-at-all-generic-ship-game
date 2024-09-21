extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var laser = $"../AnimatedSprite2D"
	var collision = $"../CollisionShape2D"
	laser.visible = false
	visible = true
	collision.disabled = true
	await get_tree().create_timer(2).timeout
	visible = false
	collision.disabled = false
	laser.visible = true
