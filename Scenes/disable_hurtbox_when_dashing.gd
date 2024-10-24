extends Node
@export var inputHandler: Node
@export var hurtBox: HurtBox
func _ready() -> void:
	inputHandler.dash.connect(on_dash)
func _exit_tree() -> void:
	inputHandler.dash.disconnect(on_dash)
	
func on_dash(duration: float):
	if not hurtBox: return
	
	hurtBox.monitoring = false
	await get_tree().create_timer(duration).timeout
	hurtBox.monitoring = true
