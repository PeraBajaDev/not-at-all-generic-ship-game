extends CharacterBody2D

@export var max_speed = 200.0
@export var acceleration = 200
@export var friction = 400
@export var dash_force = 5000
var direction: Vector2
var is_dashing := false

signal dash_finished

func _ready() -> void:
	$InputHandler.dash.connect(on_dash_input_pressed)
	
func on_dash_input_pressed(duration: float):
	is_dashing = true
	await get_tree().create_timer(duration).timeout
	is_dashing = false
	
func _physics_process(delta: float) -> void:
	direction = $InputHandler.direction
	if is_dashing:
		dash()
	elif direction:
		move(delta)
	elif velocity.length() > (friction * delta):
		velocity -= velocity.normalized() * friction * delta
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func dash():
	var tween = get_tree().create_tween()
	tween\
	.tween_property(self, 'velocity', direction * dash_force, 0.01)\
	.set_ease(Tween.EASE_OUT)
	await tween.finished
	dash_finished.emit()

func move(delta):
	velocity += direction * acceleration * delta
	velocity = velocity.limit_length(max_speed)
	
