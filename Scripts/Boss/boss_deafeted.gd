extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var healthCompontent: HealthComponent = get_parent()
	healthCompontent.died.connect(GameState.boss_defeated.emit)
