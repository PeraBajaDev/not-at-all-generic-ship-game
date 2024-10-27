class_name ExplodeOnDieComponent
extends Node2D
@export var explosionAreaScene: PackedScene
@onready var healthComponent: HealthComponent = get_parent()
@onready var node_exploding: Node2D = healthComponent.get_parent()
func _ready() -> void:
	healthComponent.died.connect(instantiate_explosion)
	
func instantiate_explosion() -> void:
	if not (node_exploding is Node2D): 
		printerr('El nodo', node_exploding.name,' a explotar no es un nodo2D.')
		return
	var explosionArea: CharacterBody2D = explosionAreaScene.instantiate()
	explosionArea.position = node_exploding.position
	node_exploding.call_deferred('add_sibling', explosionArea)
