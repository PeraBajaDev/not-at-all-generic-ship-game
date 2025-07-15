class_name MisilBulletStrategy
extends BulletStrategy


func _init(duration_in_seconds: int) -> void:
	await Engine.get_main_loop().create_timer(duration_in_seconds).timeout
	timeout.emit()

func apply_upgrade(bullet: Bullet):
	var misil: Misil= preload("res://Scenes/Misil/misil.tscn").instantiate()
	Engine.get_main_loop().current_scene.add_child(misil)
	misil.position = bullet.position
	misil.position.x += 20 
	misil.go_to_target(misil.position + Vector2.RIGHT * 100)
