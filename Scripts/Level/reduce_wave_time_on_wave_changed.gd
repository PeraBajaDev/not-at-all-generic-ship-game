extends Timer

@export var minWaitTime: float

func _ready() -> void:
	GameState.wave_changed.connect(on_wave_changed)
	
func on_wave_changed(wave: int) -> void:
	wait_time -= 0.1 * wave
	if wait_time < minWaitTime:
		wait_time = minWaitTime
