extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().hitted.connect(on_hit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_hit():
	self.play()
