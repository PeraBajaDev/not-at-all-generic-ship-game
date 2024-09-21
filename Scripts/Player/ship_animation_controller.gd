extends AnimatedSprite2D

@export var shipHandler: Node
@export var healthComponent: HealthComponent
@export var ghosting_scene: PackedScene
const HIT_EFFECT = preload("res://Scenes/Power Ups/hit_effect.tscn")
func _ready() -> void:
	healthComponent.died.connect(on_died)
	shipHandler.direction_changed.connect(on_direction_change)
	healthComponent.damaged.connect(on_hit)
	if has_node("../InputHandler"):
		$"../InputHandler".dash.connect(on_dash)
func on_hit():
	var hit_instance: AnimatedSprite2D = HIT_EFFECT.instantiate()
	get_parent().add_child(hit_instance)
	hit_instance.global_position = get_parent().position
	print(hit_instance.position, hit_instance.global_position, hit_instance)

func on_direction_change(direction):
	if direction.y < 0:
		animation = 'up'
	elif direction.y > 0:
		animation = 'down'
	else:
		animation = 'default'

func on_dash(duration: float):
	for _n in range(5):
		var ghosting: AnimatedSprite2D = ghosting_scene.instantiate()
		ghosting.sprite_frames = self.sprite_frames
		ghosting.animation = self.animation
		ghosting.position = self.global_position
		get_parent().add_sibling(ghosting)
		await get_tree().create_timer(duration / 5).timeout
		
func on_died():
	modulate = 'red'
	await get_tree().create_timer(1).timeout
	get_parent().queue_free()
