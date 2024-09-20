extends AnimatedSprite2D

const MIN_SIZE = 0.5 * Vector2.ONE
const MAX_SIZE  = 3 * Vector2.ONE

func _ready() -> void:
	scale = ($"../..".damage * Vector2.ONE) / 2
	scale = scale.clamp(MIN_SIZE, MAX_SIZE)
