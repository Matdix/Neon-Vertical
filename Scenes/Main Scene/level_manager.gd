class_name LevelManager extends Node2D

const START_CHUNCK = preload("uid://cq6i08qp06m7h")
const PLAYER = preload("uid://c6srqmff1lx37")

@export var spawnable_chunks : Array[PackedScene]

var chuncks : Array
var last_created_chunk = Chunk.new()

func _ready() -> void:
	SignalBus.create_chunck.connect(_on_chunck_created)
	var start_chunck : StartChunck = START_CHUNCK.instantiate()
	start_chunck.position = Vector2(0, 648)
	add_child(start_chunck)
	chuncks.append(start_chunck)
	last_created_chunk = start_chunck
	await get_tree().process_frame
	SignalBus.spawn_player.emit(start_chunck.player_spawn_point.global_position)
	add_chunk()
	add_chunk()
	add_chunk()
	add_chunk()
	add_chunk()
	add_chunk()
	add_chunk()

func _physics_process(delta: float) -> void:
	pass

func _on_chunck_created() -> void:
	add_chunk()

func add_chunk() -> void:
	var new_chunck : Chunk = spawnable_chunks.pick_random().instantiate()
	new_chunck.position = last_created_chunk.exit.global_position
	add_child(new_chunck)
	chuncks.append(new_chunck)
	last_created_chunk = new_chunck
