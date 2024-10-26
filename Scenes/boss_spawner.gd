extends Marker2D

@export var bossScene: PackedScene
const WAVE_TO_SPAWN_BOSS = 10
@onready var level: Node2D = $"../.."

func _ready() -> void:
	GameState.wave_changed.connect(on_wave_changed)

func on_wave_changed(current_wave):
	if current_wave == WAVE_TO_SPAWN_BOSS:
		spawn_boss()
		level.modulate = Color.BLACK
		GameState.boss_spawned.emit()
func spawn_boss() -> void:
	var boss: Node2D = bossScene.instantiate()
	boss.position = self.position
	level.add_child(boss)
