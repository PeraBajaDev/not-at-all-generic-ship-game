extends PowerUp


func apply(body):
	var healthComponent : HealthComponent = body.get_node('HealthComponent')
	if healthComponent:
		healthComponent.inscrease_max_health()
		healthComponent.health = healthComponent.maxHealth
