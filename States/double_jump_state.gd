class_name DoubleJumpState extends State

func enter() -> void:
	character.velocity.y = JUMP_SPEED
	animation_player.play("double_jump")

func physics_update(delta: float) -> void:
	if Input.is_action_pressed("jump"):
		character.velocity.y += LONG_JUMP_SPEED * delta 
	
	if !animation_player.is_playing():
		animation_player.play("fall")
	
	character.velocity.y += character.get_gravity().y * delta
	if character.velocity.y > 0:
		state_machine.change_state("fallingstate")
	
	var direction = Input.get_axis("left", "right")
	character.velocity.x = walk_speed * direction * 1000 * delta
	
	if right_wall_ray_cast.is_colliding():
		state_machine.change_state("wallslidestate")
	elif left_wall_ray_cast.is_colliding():
		state_machine.change_state("wallslidestate")
	
	if direction < 0:
		sprite_2d.flip_h = true
	elif direction > 0:
		sprite_2d.flip_h = false
	
	character.move_and_slide()
	
	if character.is_on_floor():
		if direction != 0:
			state_machine.change_state("walkstate")
		else:
			state_machine.change_state("idlestate")

func exit() -> void:
	GlobalVariables.make_coyote_time = false
	GlobalVariables.has_double_jump = true
