class_name Sound
extends AudioStreamPlayer

func _process(_delta: float) -> void:
	volume_db = GameState.sound_volume
