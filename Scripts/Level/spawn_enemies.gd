extends "res://Scripts/Level/spawn_nodes.gd"

@export var maxSpawnRate: int

func on_wave_changed(wave: int):
	super.on_wave_changed(wave)
	spawnRate = wave 
	if spawnRate > maxSpawnRate: 
		spawnRate = maxSpawnRate
