extends PowerUp
var spread_bullet_scene = preload('res://Scenes/Power Ups/player_bullet_spreader.tscn')

func apply(body: Node2D):
	if body.has_node('BlastCanon'):
		var canon: BlastCanon = body.get_node('BlastCanon')
		canon.change_on_power_up(spread_bullet_scene, 10)
