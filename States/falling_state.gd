class_name FallingState extends State

var walk_speed = 20

func enter() -> void:
	animation_player.play("fall")

func physics_update(delta: float) -> void:
	character.velocity.y += character.get_gravity().y * delta
	
	var direction = Input.get_axis("left", "right")
	character.velocity.x = walk_speed * direction * 1000 * delta
	
	if direction < 0:
		sprite_2d.flip_h = true
	elif direction > 0:
		sprite_2d.flip_h = false
	
	character.move_and_slide()
	
	if character.is_on_floor():
		if direction != 0:
			state_machine.change_state("walkstate")
		elif Input.is_action_just_pressed("jump"):
			state_machine.change_state("jumpstate")
		else:
			state_machine.change_state("idlestate")
