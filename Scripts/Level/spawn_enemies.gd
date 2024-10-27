extends Spawner

@export var maxSpawnRate: int
func _ready() -> void:
	super._ready()
	GameState.wave_changed.connect(limit_spawn_rate)
	GameState.boss_spawned.connect(func(): disabled = true)
func limit_spawn_rate(currentWave: int):
	spawnRate = currentWave
	if spawnRate > maxSpawnRate:
		spawnRate = maxSpawnRate
