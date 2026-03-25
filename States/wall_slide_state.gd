class_name WallSlideState extends State

func enter() -> void:
	animation_player.play("wall_slide")

func physics_update(delta: float) -> void:
	character.velocity.y = character.get_gravity().y * delta * 2.5
	
	if right_wall_ray_cast.is_colliding():
		sprite_2d.flip_h = true
	elif left_wall_ray_cast.is_colliding():
		sprite_2d.flip_h = false
	else:
		state_machine.change_state("fallingstate")
	
	if character.is_on_floor():
		if Input.is_action_just_pressed("jump"):
			state_machine.change_state("jumpstate")
		else:
			state_machine.change_state("idlestate")
			
	character.move_and_slide()

func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state("walljumpstate")
	if Input.is_action_pressed("left") and left_wall_ray_cast.is_colliding():
		state_machine.change_state("fallingstate")
	if Input.is_action_pressed("right") and right_wall_ray_cast.is_colliding():
		state_machine.change_state("fallingstate")

func exit() -> void:
	GlobalVariables.make_coyote_time = true
	GlobalVariables.has_double_jump = false
