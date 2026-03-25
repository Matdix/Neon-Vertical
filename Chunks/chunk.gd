class_name Chunk extends Node2D

@onready var enter: Marker2D = $Enter
@onready var exit: Marker2D = $Exit

func _process(delta: float) -> void:
	if global_position.y - GlobalVariables.player.global_position.y > 3000:
		SignalBus.create_chunck.emit()
		queue_free()
