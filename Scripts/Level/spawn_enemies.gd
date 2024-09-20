extends Node2D

@export var nodes: Array[PackedScene]
@export var _range: float 
@export var spawnPropagationDirection: Vector2 
@export var spawnRate: int 
func _ready() -> void:
	$Timer.timeout.connect(on_timeout)

func on_timeout():
	for n in range(randi_range(0, spawnRate)):
		var node = nodes.pick_random().instantiate()
		node.position = self.position
		node.position += spawnPropagationDirection * randf_range(-_range, _range)
		add_sibling(node)
