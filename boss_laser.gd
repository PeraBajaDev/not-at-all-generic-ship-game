extends Bullet

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(self, 'rotation_degrees', -90, 1).as_relative()
	
