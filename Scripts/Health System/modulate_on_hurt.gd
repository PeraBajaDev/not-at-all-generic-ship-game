extends Node

@export var healthComponent: HealthComponent
@onready var sprite: AnimatedSprite2D = get_parent()
func _ready() -> void:
	healthComponent.damaged.connect(modulate_on_hurt)


func modulate_on_hurt() -> void:
	var hurtPercentage: float = (healthComponent.maxHealth - healthComponent.health) / float(healthComponent.maxHealth)
	sprite.modulate.r += hurtPercentage
