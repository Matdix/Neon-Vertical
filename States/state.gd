class_name State extends Node

var state_machine: StateMachine
var character: CharacterBody2D
var animation_player: AnimationPlayer
var sprite_2d: Sprite2D
var left_wall_ray_cast: RayCast2D
var right_wall_ray_cast: RayCast2D

@export var walk_speed = 20
@export var JUMP_SPEED = -500
@export var LONG_JUMP_SPEED = -400

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func handle_input(_event: InputEvent) -> void:
	pass
