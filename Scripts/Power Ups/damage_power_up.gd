extends PowerUp


func apply(body: Node2D):
	var canon = body.get_node('BlastCanon')
	if canon:
		canon.damage += 1 
