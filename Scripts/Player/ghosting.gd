extends AnimatedSprite2D
 
func _ready():
	var tween_fade = get_tree().create_tween()
 
	tween_fade.tween_property(self, "self_modulate",Color(1, 1, 1, 0), 0.75 )
	await tween_fade.finished
 
	queue_free()
	
