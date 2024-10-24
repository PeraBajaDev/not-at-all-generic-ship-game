extends State


@onready var enemy: CharacterBody2D = $"../.."
@onready var initialPosition = enemy.position

func enter():
	var tween = get_tree().create_tween()
	tween.tween_property(enemy, 'velocity:x', -400, 0.5).set_ease(Tween.EASE_IN)
	tween.tween_property(enemy, 'velocity:x', 300, 1).set_ease(Tween.EASE_OUT)
	enemy.velocity.y = randi_range(-50, 50)
	tween.tween_property(enemy, 'position', initialPosition, 1).set_ease(Tween.EASE_OUT)
	await tween.finished
	stateMachine.change_state(stateMachine.states.pick_random())

func state_physics_process(_delta: float) -> void:
	enemy.move_and_slide()
