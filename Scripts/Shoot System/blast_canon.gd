class_name BlastCanon
extends BaseCanon

func on_shoot():
	super.on_shoot()
	get_parent().add_sibling(bullet)
