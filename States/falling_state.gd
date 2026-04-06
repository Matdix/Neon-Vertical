class_name FallingState extends State

var coyote_timer : SceneTreeTimer
var jump_buffer_timer : SceneTreeTimer

func enter() -> void:
	animation_player.play("fall")
	if GlobalVariables.make_coyote_time:
		coyote_time()

func physics_update(delta: float) -> void:
	if GlobalVariables.make_coyote_time:
		if coyote_timer.time_left != 0:
			if Input.is_action_just_pressed("jump"):
				GlobalVariables.make_coyote_time = false
				coyote_timer = null
				state_machine.change_state("jumpstate")
		if coyote_timer == null:
			GlobalVariables.make_coyote_time = false
	
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
		if jump_buffer_timer != null:
			if jump_buffer_timer.time_left != 0:
				state_machine.change_state("jumpstate")
	
	character.move_and_slide()

func exit() -> void:
	GlobalVariables.make_coyote_time = false 

func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump") and !GlobalVariables.has_double_jump:
		state_machine.change_state("doublejumpstate")
	elif Input.is_action_just_pressed("jump") and (coyote_timer == null or coyote_timer.time_left == 0):
		jump_buffer_timer = get_tree().create_timer(0.1)
		

func coyote_time() -> void:
	coyote_timer = get_tree().create_timer(0.2)
