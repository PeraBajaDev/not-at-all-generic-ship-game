extends Control

@export var playerStats: PlayerStats

func _ready() -> void:
	playerStats.died.connect(show_screen)

func show_screen():
	visible = true
	$"Panel/VBoxContainer/Retry?/AnimationPlayer".play("RESET")
