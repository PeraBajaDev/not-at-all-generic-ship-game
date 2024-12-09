extends Node

signal shoot
signal direction_changed(direction)
signal dash(duration: float)
const DASH_DURATION = 0.25
var direction : Vector2 

@export var recoil: float
@export var dash_recoil: float

func _process(_delta: float) -> void:
	direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	direction_changed.emit(direction)
	
	if Input.is_action_pressed("player_shoot"):
		if $ShootTimer.is_stopped(): 
			shoot.emit()
			$ShootTimer.start(recoil)
	if Input.is_action_just_pressed('player_dash'):
		if $DashTimer.is_stopped():
			dash.emit(DASH_DURATION)
			$DashTimer.start(dash_recoil)
