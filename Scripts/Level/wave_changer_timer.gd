extends Timer

var current_wave = 0
@export var seconds_to_next_wave: int
func _ready() -> void:
	timeout.connect(change_wave)

func change_wave(): 
	current_wave += 1
	GameState.wave_changed.emit(current_wave)
	self.start(seconds_to_next_wave)
