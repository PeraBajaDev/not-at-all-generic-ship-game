extends Timer


func _ready() -> void:
	timeout.connect(
		func(): get_parent().queue_free()
	)
	
