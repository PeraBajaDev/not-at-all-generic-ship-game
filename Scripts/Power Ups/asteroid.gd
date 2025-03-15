extends Area2D

@export var powerUpsScenes: Array[PackedScene] 
const PROBABILITIES: Array[float] = [0.06, 0.2, 0.8, 0.9, 0.1]
@onready var asteroid = get_parent()

func _ready() -> void:
	self.body_entered.connect(on_body_entered)

func on_body_entered(body):
	var bullet := body.get_parent() as Bullet
	
	if bullet:
		pick_random_power_up()
		bullet.queue_free()
		asteroid.queue_free()
		
# TODO corregir responsabilidades de las funciones
func pick_random_power_up():
	var probability : float = randf_range(0, 1)
	for n in range(powerUpsScenes.size()):
		if n == powerUpsScenes.size() - 1:
			create_power_up(n)
			return
		if probability < PROBABILITIES[n]:
			create_power_up(n)
			return
			
func create_power_up(index: int):
	var powerUp: PowerUp = powerUpsScenes[index].instantiate()
	powerUp.position = asteroid.global_position
	asteroid.call_deferred("add_sibling", powerUp)
