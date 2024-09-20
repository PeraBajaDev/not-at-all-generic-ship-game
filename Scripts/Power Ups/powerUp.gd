class_name PowerUp
extends Area2D

func _ready() -> void:
	self.body_entered.connect(on_body_entered)

func on_body_entered(body: Node2D):
	apply(body)
	var powerUpInfo = $DisplayInfo/AnimationPlayer as AnimationPlayer
	powerUpInfo.play('RESET')
	await powerUpInfo.animation_finished
	queue_free()
	
func apply(_body: Node2D):
	pass
