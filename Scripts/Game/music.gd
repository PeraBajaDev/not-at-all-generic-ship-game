extends AudioStreamPlayer2D

func _ready() -> void:
	play()
func _process(_delta: float) -> void:
	volume_db = GameState.music_volume
