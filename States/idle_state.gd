class_name IdleState extends State

func enter() -> void:
	print("Entering idle state")

func physics_update(delta: float) -> void:
	if !character.is_on_floor():
		state_machine.change_state("fallingstate")

func handle_input(event: InputEvent) -> void:
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		state_machine.change_state("walkstate")
	elif Input.is_action_just_pressed("jump"):
		state_machine.change_state("jumpstate")
