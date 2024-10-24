class_name State
extends Node

@onready var stateMachine: StateMachine = get_parent() 

func state_physics_process(_delta: float) -> void:
	pass

func state_process(_delta: float) -> void:
	pass
func enter():
	pass
func exit():
	pass
