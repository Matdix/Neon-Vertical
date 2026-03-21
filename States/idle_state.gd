class_name IdleState extends State

func enter() -> void:
	animation_player.play("idle")

func physics_update(_delta: float) -> void:
	if !character.is_on_floor():
		state_machine.change_state("fallingstate")

func handle_input(_event: InputEvent) -> void:
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		state_machine.change_state("walkstate")
	elif Input.is_action_just_pressed("jump"):
		state_machine.change_state("jumpstate")
