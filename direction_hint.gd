extends Sprite2D

@export var playerStats: PlayerStats
@export var waitTimeToLocalizePlayer: float = 2
@export var is_always_seeking: bool = false
var timer: SceneTreeTimer
var smoothTime: float = 0
signal playerLocalized(position: Vector2)

func _ready():
	timer = get_tree().create_timer(waitTimeToLocalizePlayer)

func _process(delta: float) -> void:
	smoothTime += delta * 2
	if timer.time_left <= 0 and not is_always_seeking:
		playerLocalized.emit(position) 
		return
		
	global_position.x = playerStats.position.x
	global_position.y = move_toward(global_position.y, playerStats.position.y, smoothTime)
