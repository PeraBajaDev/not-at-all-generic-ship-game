class_name StateMachine
extends Node

var states: Array[State]
var currentState: State
func _ready() -> void:
	for child in get_children():
		if not child is State: 
			printerr('Error el hijo ', child.name, ' no es un State')
			return
		states.append(child)
	currentState = states[0]
	currentState.enter()
	
func _process(delta: float) -> void:
	currentState.state_process(delta)
	
func _physics_process(delta: float) -> void:
	currentState.state_physics_process(delta)
	
func change_state(new_state: State):
	if new_state in states:
		currentState.exit()
		new_state.enter()
		currentState = new_state
