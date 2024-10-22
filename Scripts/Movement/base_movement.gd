class_name BaseMovement
extends CharacterBody2D

@export var speed: int
@export var direction: Vector2

func _ready() -> void:
	velocity = speed * direction
