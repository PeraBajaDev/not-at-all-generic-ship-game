extends Area2D

@onready var dialog_box: MarginContainer = get_parent()
func _ready() -> void:
	body_entered.connect(fade)
	body_exited.connect(opac)
func fade(_body):
	dialog_box.modulate.a = 0.3
func opac(_body):
	dialog_box.modulate.a = 1
