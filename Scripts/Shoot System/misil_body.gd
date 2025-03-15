class_name Misil
extends Bullet
@export var explosionAreaScene: PackedScene
func go_to_target(targetPosition: Vector2):
		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property(self, 'position', targetPosition, 0.7).set_ease(Tween.EASE_IN)
		tween.tween_property(self, 'rotation', targetPosition.angle_to_point(position), 0.5).set_ease(Tween.EASE_IN_OUT)
		await tween.finished
		explode()
		queue_free()
func explode():
	var explosionArea: CharacterBody2D = explosionAreaScene.instantiate()
	explosionArea.position = position
	add_sibling(explosionArea)
