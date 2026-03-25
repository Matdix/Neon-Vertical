class_name WalkState extends State

func enter() -> void:
	animation_player.play("walk")

func physics_update(delta: float) -> void:
	var direction = Input.get_axis("left", "right")
	
	if direction < 0:
		sprite_2d.flip_h = true
	elif direction > 0:
		sprite_2d.flip_h = false
	else:
		state_machine.change_state("idlestate")
		return
	
	character.velocity.x = walk_speed * direction * 1000 * delta
	character.move_and_slide()
	
	if character.velocity.x == 0:
		animation_player.play("idle")
	else:
		animation_player.play("walk")
	
	if !character.is_on_floor():
		state_machine.change_state("fallingstate")

func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state("jumpstate")
