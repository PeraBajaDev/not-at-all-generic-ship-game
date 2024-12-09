extends AnimatedSprite2D

@export var shipHandler: Node
@export var healthComponent: HealthComponent

const HIT_EFFECT = preload("res://Scenes/Power Ups/hit_effect.tscn")
func _ready() -> void:
	healthComponent.dying.connect(on_dying)
	shipHandler.direction_changed.connect(on_direction_change)
	healthComponent.damaged.connect(on_hit)

func on_hit():
	var hit_instance: AnimatedSprite2D = HIT_EFFECT.instantiate()
	get_parent().add_child(hit_instance)
	hit_instance.global_position = get_parent().position
	print(hit_instance.position, hit_instance.global_position, hit_instance)

func on_direction_change(direction):
	if direction.y < -0.5:
		animation = 'up'
	elif direction.y > 0.5:
		animation = 'down'
	else:
		animation = 'default'
		
func on_dying():
	modulate = 'red'
