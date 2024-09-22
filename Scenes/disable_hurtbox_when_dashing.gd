extends Node
@export var inputHandler: Node
func _ready() -> void:
	print(inputHandler)
	$"../InputHandler".dash.connect(on_dash)

func on_dash(duration: float):
	$"../HurtBox".monitoring = false
	await get_tree().create_timer(duration).timeout
	$"../HurtBox".monitoring = true
