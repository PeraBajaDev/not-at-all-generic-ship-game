extends State
@onready var enemy: Node2D = $"../.."
@export var misilHint: Node2D 
const MISIL_COUNT = 3
const RECOIL_SECONDS = 0.5
signal shoot
func enter():
	misilHint.show()
	await get_tree().create_timer(1).timeout
	for i in range(MISIL_COUNT):
		shoot.emit()
		await get_tree().create_timer(RECOIL_SECONDS).timeout
	stateMachine.change_state($"../TackleState")

func exit():
	misilHint.hide()
