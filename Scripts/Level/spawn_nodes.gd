class_name Spawner
extends Node2D

@export var spawnableScenes: Array[PackedScene]
@export var spawnRange: float 
@export var spawnPropagationDirection: Vector2 
@export var spawnRate: int 
var aviablesScenes: Array[PackedScene] = []
var aviableNodeIndex := 0

func _ready() -> void:
	assert(has_node("Timer"), 'El nodo spawner necesita un timer')
	assert(not $Timer.autostart, 'El nodo timer debe auto inciciarce')
	$Timer.timeout.connect(spawn_node)
	GameState.wave_changed.connect(add_aviable_node)
	
func spawn_node():
	for n in range(randi_range(1, spawnRate)):
		var node = aviablesScenes.pick_random().instantiate()
		node.position = self.position
		node.position += spawnPropagationDirection * randf_range(-spawnRange, spawnRange)
		add_sibling(node)

func add_aviable_node(_currentWave):
	if aviableNodeIndex < spawnableScenes.size():
		aviablesScenes.append(spawnableScenes[aviableNodeIndex])
	aviableNodeIndex += 1
