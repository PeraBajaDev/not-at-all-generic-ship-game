class_name AbilityCooldown
extends TextureProgressBar
var tween: Tween
func start_animation(duration_in_seconds: int) -> void:
	print("hola")
	value = 100
	show()
	if tween: tween.kill()
	tween = get_tree().create_tween()
	tween.tween_property(self, "value", 0, duration_in_seconds).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	hide()
