extends PowerUp


func apply(body: Node2D):
	if body.has_node('BlastCanon'):
		var canon: BlastCanon = body.get_node('BlastCanon')
		var strategy = await BulletDivisionStrategy.new()
		canon.bullet_strategies.append(strategy)
