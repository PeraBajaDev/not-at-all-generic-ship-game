extends CPUParticles2D

@export var healthComponent: HealthComponent

func _ready() -> void:
	healthComponent.damaged.connect(on_damaged)

func on_damaged():
	@warning_ignore("integer_division")
	var particleAmount = (healthComponent.maxHealth - healthComponent.health) / 10
	amount = particleAmount if particleAmount >= 1 else 1
