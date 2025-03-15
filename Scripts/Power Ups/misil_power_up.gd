extends PowerUp

func apply(body: Node2D):
	var canon = body.get_node('BlastCanon') as BlastCanon
	if canon:
		canon.bullet_strategies.append(await MisilBulletStrategy.new())
