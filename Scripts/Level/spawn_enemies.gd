extends Spawner

@export var maxSpawnRate: int

func _ready() -> void:
	super._ready()
	GameState.wave_changed.connect(limit_spawn_rate)

func limit_spawn_rate(currentWave: int):
	if maxSpawnRate > currentWave:
		spawnRate = maxSpawnRate
