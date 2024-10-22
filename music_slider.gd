extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value_changed.connect(adjust_music_db)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func adjust_music_db(new_value: float) -> void:
	GameState.music_volume = new_value
