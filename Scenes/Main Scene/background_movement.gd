extends TextureRect

func _physics_process(delta: float) -> void:
	position.y += 30 * delta
	if position.y == 648:
		position.y = -1280
