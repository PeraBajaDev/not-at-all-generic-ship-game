extends PowerUp


func apply(body: Node2D):
	var canon: BlastCanon = body.get_node('BlastCanon')
	if canon:
		canon.bullet_scene = preload('res://Scenes/Power Ups/player_bullet_spreader.tscn')
