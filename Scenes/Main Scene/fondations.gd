extends Node2D

const START_CHUNCK = preload("uid://cq6i08qp06m7h")

@export var spawnable_chunks : Array[PackedScene]

var chuncks : Array
var last_created_chunk = Chunk.new()

func _ready() -> void:
	var new_chunck : Chunk = START_CHUNCK.instantiate()
	new_chunck.position = Vector2(0, 648)
	add_child(new_chunck)
	chuncks.append(new_chunck)
	last_created_chunk = new_chunck
	add_chunk()

func _physics_process(delta: float) -> void:
	pass

func add_chunk() -> void:
	var new_chunck : Chunk = spawnable_chunks.pick_random().instantiate()
	new_chunck.position = last_created_chunk.exit.global_position
	add_child(new_chunck)
	chuncks.append(new_chunck)
	last_created_chunk = new_chunck
