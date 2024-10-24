extends Node

@export var ghosting_scene: PackedScene
@export var inputHandler: Node
@onready var animatedSprite: AnimatedSprite2D = get_parent()
func _ready() -> void:
	inputHandler.dash.connect(create_ghosting)
func create_ghosting(duration: float):
	for _n in range(5):
		var ghosting: AnimatedSprite2D = ghosting_scene.instantiate()
		ghosting.sprite_frames = animatedSprite.sprite_frames
		ghosting.animation = animatedSprite.animation
		ghosting.position = animatedSprite.global_position
		animatedSprite.get_parent().add_sibling(ghosting)
		await get_tree().create_timer(duration / 5).timeout
