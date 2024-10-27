extends Bullet

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(self, 'rotation_degrees', -90, 0.5).as_relative().set_ease(Tween.EASE_IN).set_delay(0.5)
	
