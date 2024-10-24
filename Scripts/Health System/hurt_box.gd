class_name HurtBox
extends Area2D

@export var healthComponent: HealthComponent 

@export var invincibilityTime: float
signal hitted
func _ready() -> void:
	self.body_entered.connect(on_hurt)
	healthComponent.died.connect(queue_free)
	
func on_hurt(body: Node2D):
	if not $InvencibilityTimer.is_stopped():
		return
	if not healthComponent:
		push_warning('Falta asignar nodo health component')
		return
		
	hitted.emit()
	var bullet := body.get_parent() as Bullet
	var damage: int = 1
	if bullet:
		damage = bullet.damage
		bullet.queue_free()
	healthComponent.harm(damage)
	$InvencibilityTimer.start(invincibilityTime)
