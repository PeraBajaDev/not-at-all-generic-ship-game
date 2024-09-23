extends PowerUp


func apply(body: Node2D):
	if body.has_node('BlastCanon'):
		var canon: BlastCanon = body.get_node('BlastCanon')
		canon.bullet_scene = preload('res://Scenes/Power Ups/player_bullet_spreader.tscn')
