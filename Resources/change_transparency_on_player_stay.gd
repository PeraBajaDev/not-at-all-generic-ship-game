extends Area2D

@onready var dialog_box: MarginContainer = get_parent()
func _ready() -> void:
	body_entered.connect(fade)
	body_exited.connect(opac)
func fade(body):
	dialog_box.modulate.a = 0.3
func opac(body):
	dialog_box.modulate.a = 1
