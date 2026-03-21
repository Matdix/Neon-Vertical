class_name WallSlideState extends State

func enter() -> void:
	animation_player.play("wall_slide")

func physics_update(delta: float) -> void:
	character.velocity.y = character.get_gravity().y * delta * 2.5
	
	character.move_and_slide()
	
	if !character.is_on_wall():
		state_machine.change_state("fallingstate")
	
	if character.is_on_floor():
		if Input.is_action_just_pressed("jump"):
			state_machine.change_state("jumpstate")
		else:
			state_machine.change_state("idlestate")
