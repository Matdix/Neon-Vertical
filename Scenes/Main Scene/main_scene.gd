extends Node

const PLAYER = preload("uid://c6srqmff1lx37")

func _enter_tree() -> void:
	SignalBus.spawn_player.connect(_on_spawn_player)

func _on_spawn_player(position: Vector2) -> void:
	var player : Player = PLAYER.instantiate()
	player.name = "Player"
	player.global_position = position
	add_child(player)
