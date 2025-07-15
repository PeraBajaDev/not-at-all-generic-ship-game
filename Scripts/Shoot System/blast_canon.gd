class_name BlastCanon
extends BaseCanon
 
func on_shoot():
	super.on_shoot()
	var entity := get_parent()
	entity.add_sibling(bullet)
