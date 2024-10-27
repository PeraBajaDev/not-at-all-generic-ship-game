extends AudioStreamPlayer

func _ready() -> void:
	$"../../InputHandler".shoot.connect(on_shoot)
	
func on_shoot():
	pitch_scale = randf_range(0.6, 1)
	self.play()
