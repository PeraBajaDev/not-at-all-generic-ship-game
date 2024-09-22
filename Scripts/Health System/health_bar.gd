extends TextureRect

@export var player: PlayerStats
var tween
	
func _process(_delta: float) -> void:
	tween = get_tree().create_tween()
	tween.parallel().tween_property(self, 'size', Vector2(player.maxHealth * 10, size.y), 0.5)
	tween.parallel().tween_property($CurrentHealth, 'size', Vector2(player.health * 10, size.y), 0.5)
	
	print($CurrentHealth.size)
