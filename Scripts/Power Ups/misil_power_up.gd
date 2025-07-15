extends PowerUp

const DURATION_IN_SECONDS: int = 5
func apply(body: Node2D):
	var canon = body.get_node('BlastCanon') as BlastCanon
	if canon:
		canon.bullet_strategies.append(await MisilBulletStrategy.new(DURATION_IN_SECONDS))
	if not canon.is_in_group("player"): return
	var ability_cooldown : AbilityCooldown = canon.get_child(0)
	ability_cooldown.start_animation(DURATION_IN_SECONDS)
