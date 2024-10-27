extends Marker2D

@export var bossScene: PackedScene
const WAVE_TO_SPAWN_BOSS = 15
@onready var screenOccluder: Node2D = $ScreenOccluder
var boss: Node2D
func _ready() -> void:
	GameState.wave_changed.connect(on_wave_changed)

func on_wave_changed(current_wave):
	if current_wave == WAVE_TO_SPAWN_BOSS:
		GameState.boss_spawned.emit()
		spawn_boss()
		boss.top_level = true
		screenOccluder.show()
		await pause_game()
		screenOccluder.hide()
		boss.top_level = false
func spawn_boss() -> void:
	boss = bossScene.instantiate()
	boss.position = self.position
	self.add_sibling(boss)
	
func pause_game():
	get_tree().paused = true
	var tween = create_tween()
	boss.modulate.a = 0
	tween.tween_property(screenOccluder, 'self_modulate:a', 1, 2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(boss, 'modulate:a', 1, 2).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	await tween.finished
	get_tree().paused = false
