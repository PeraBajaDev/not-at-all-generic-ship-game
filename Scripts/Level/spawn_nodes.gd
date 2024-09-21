extends Node2D

@export var nodes: Array[PackedScene]
@export var _range: float 
@export var spawnPropagationDirection: Vector2 
@export var spawnRate: int 
var aviablesNodes = []
func _ready() -> void:
	assert(has_node("Timer"), 'El nodo spawner necesita un timer')
	assert(not $Timer.autostart, 'El nodo timer debe auto inciciarce')
	$Timer.timeout.connect(on_timeout)
	GameState.wave_changed.connect(on_wave_changed)
func on_timeout():
	for n in range(randi_range(1, spawnRate)):
		var node = aviablesNodes.pick_random().instantiate()
		node.position = self.position
		node.position += spawnPropagationDirection * randf_range(-_range, _range)
		add_sibling(node)

func on_wave_changed(wave):
	var index = wave - 1
	if index < nodes.size():
		aviablesNodes.append(nodes[index])
