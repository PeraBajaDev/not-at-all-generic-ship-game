extends BlastCanon

@export var misilHint: Node2D

func on_shoot():
	super.on_shoot()
	if bullet.has_method('go_to_target'):
		bullet.go_to_target(misilHint.global_position)
