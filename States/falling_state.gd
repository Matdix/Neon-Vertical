class_name FallingState extends State

var timer = SceneTreeTimer

func enter() -> void:
	animation_player.play("fall")
	coyote_time()

func physics_update(delta: float) -> void:
	if timer.time_left != 0:
		if Input.is_action_just_pressed("jump"):
			state_machine.change_state("jumpstate")
	
	character.velocity.y += character.get_gravity().y * delta
	
	var direction = Input.get_axis("left", "right")
	character.velocity.x = walk_speed * direction * 1000 * delta
	
	if direction < 0:
		sprite_2d.flip_h = true
	elif direction > 0:
		sprite_2d.flip_h = false
	
	if right_wall_ray_cast.is_colliding():
		state_machine.change_state("wallslidestate")
	elif left_wall_ray_cast.is_colliding():
		state_machine.change_state("wallslidestate")
	
	if character.is_on_floor():
		if direction != 0:
			state_machine.change_state("walkstate")
		elif Input.is_action_just_pressed("jump"):
			state_machine.change_state("jumpstate")
		else:
			state_machine.change_state("idlestate")
	
	character.move_and_slide()

func coyote_time() -> void:
	timer = get_tree().create_timer(0.2)
