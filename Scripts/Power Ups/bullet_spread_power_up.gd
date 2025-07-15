extends PowerUp

const DURATION_IN_SECONDS : int = 5
func apply(body: Node2D):
	if body.has_node('BlastCanon'):
		var canon: BlastCanon = body.get_node('BlastCanon')
		var strategy = await BulletDivisionStrategy.new(DURATION_IN_SECONDS)
		canon.bullet_strategies.append(strategy)
		if not canon.is_in_group("player"): return
		var ability_cooldown : AbilityCooldown = canon.get_child(0)
		ability_cooldown.start_animation(DURATION_IN_SECONDS)
