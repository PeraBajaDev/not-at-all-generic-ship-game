extends Label

func _ready() -> void:
	GameState.wave_changed.connect(show_current_wave)

func show_current_wave(wave: int):
	visible = true
	text = 'Wave ' + str(wave)
	await get_tree().create_timer(3).timeout
	visible = false
