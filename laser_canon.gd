extends BlastCanon

func on_shoot():
	bullet = bullet_scene.instantiate()
	bullet.damage = damage
	bullet.position = self.position
	get_parent().add_child(bullet)
