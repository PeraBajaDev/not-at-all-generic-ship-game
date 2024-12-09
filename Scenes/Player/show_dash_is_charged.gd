extends Node

@export	var dashTimer: Timer
@onready var playerSprite: AnimatedSprite2D = get_parent()

func _ready() -> void:
	dashTimer.timeout.connect(change_player_color)

func change_player_color():
	playerSprite.modulate = Color.AQUAMARINE
	var tween = create_tween()
	tween.tween_property(playerSprite, 'modulate', Color.WHITE, 0.7).set_ease(Tween.EASE_OUT)
