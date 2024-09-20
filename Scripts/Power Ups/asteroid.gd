extends Area2D

@export var powerUps: Array[PackedScene] 
var probabilities: Array = [0.06, 0.2, 0.8, 0.9]

func _ready() -> void:
	self.body_entered.connect(on_body_entered)

func on_body_entered(body):
	var bullet := body.get_parent() as Bullet
	print(body)
	if bullet:
		pick_random_power_up()
		bullet.queue_free()
		get_parent().queue_free()

func pick_random_power_up():
	var probability : float = randf_range(0, 1)
	for n in range(powerUps.size()):
		if n == powerUps.size() - 1:
			create_power_up(n)
			return
		if probability < probabilities[n]:
			create_power_up(n)
			return
			

func create_power_up(index: int):
	var powerUp: PowerUp = powerUps[index].instantiate()
	powerUp.position = get_parent().position
	get_parent().add_sibling(powerUp)
