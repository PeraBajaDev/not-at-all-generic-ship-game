class_name PowerUp
extends Area2D

@onready var powerUpLabel = $DisplayInfo/AnimationPlayer as AnimationPlayer
@export var playerStats: PlayerStats
@export var statValue: float
@export_enum('health', 
			'maxHealth', 
			'rechargeSpeed', 
			'bulletScene',
			'damage',
			'bullet') var statName: String

func _ready() -> void:
	self.body_entered.connect(on_body_entered)
	self.body_entered.connect(display_info)
func on_body_entered(_body: Node2D):
	if statName in playerStats:
		playerStats.set(statName, playerStats.get(statName) + statValue)
		self.queue_free()
	else:
		push_warning('la estadistica "', statName, '" no se encuentra en playerStats.')

func display_info(_body):
	powerUpLabel.play('RESET')
