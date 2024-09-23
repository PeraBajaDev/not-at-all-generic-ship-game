extends Area2D

@export var healthComponent: HealthComponent 

@export var invincibilityTime: float

func _ready() -> void:
	self.body_entered.connect(on_hurt)
	
func on_hurt(body: Node2D):
	if not $InvencibilityTimer.is_stopped():
		return
	if not healthComponent:
		push_warning('Falta asignar nodo health component')
		return
	$HitSound.play()
	var bullet := body.get_parent() as Bullet
	var damage: int = 1
	if bullet:
		body.queue_free()
		damage = bullet.damage
	healthComponent.harm(damage)
	$InvencibilityTimer.start(1)  
