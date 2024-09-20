extends TextureRect

@export var player: PlayerStats


func _process(_delta: float) -> void:
	var tween = get_tree().create_tween()
	
	tween.parallel().tween_property(self, 'size', Vector2(player.maxHealth * 10, size.y), 0.5)\
	.set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property($CurrentHealth, 'size', Vector2(player.health * 10, size.y), 0.5)\
	.set_ease(Tween.EASE_OUT)
