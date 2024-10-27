extends AudioStreamPlayer2D

@export var bossTheme: Resource
@export var volumeBossTheme: float

func _ready() -> void:
	GameState.boss_spawned.connect(change_to_boss_theme)
	play()
func change_to_boss_theme():
	stream = bossTheme
	volume_db = volumeBossTheme
	play()
