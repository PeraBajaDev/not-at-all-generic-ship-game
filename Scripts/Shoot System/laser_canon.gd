extends BlastCanon

func on_shoot():
	super.on_shoot()
	get_parent().add_child(bullet)
