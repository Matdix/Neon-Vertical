extends Label

func _process(delta: float) -> void:
	text = "Height : " + str(roundi(int(-GlobalVariables.player.global_position.y / 48)) + 10) + " m"
