class_name WallJumpState extends State

var jump_direction
var jumping = true

func enter() -> void:
	jumping = true
	if character.get_wall_normal() == Vector2.RIGHT:
		jump_direction = "right"
	elif character.get_wall_normal() == Vector2.LEFT:
		jump_direction = "left"
	character.velocity.y = JUMP_SPEED
	animation_player.play("jump")

func physics_update(delta: float) -> void:
	character.velocity.y += character.get_gravity().y * delta
	if character.velocity.y > 0:
		state_machine.change_state("fallingstate")
	
	if jumping:
		if jump_direction == "left":
			character.velocity.x = -walk_speed * delta * 5000
			sprite_2d.flip_h = true
		if jump_direction == "right":
			character.velocity.x = walk_speed * delta * 5000
			sprite_2d.flip_h = false
		
		jumping = false
		
		if character.is_on_floor():
			state_machine.change_state("idlestate")
	else:
		var direction = Input.get_axis("left", "right")
		character.velocity.x = walk_speed * direction * 1000 * delta
		
		if direction < 0:
			sprite_2d.flip_h = true
		elif direction > 0:
			sprite_2d.flip_h = false
		
		if character.is_on_floor():
			if direction != 0:
				state_machine.change_state("walkstate")
			else:
				state_machine.change_state("idlestate")
	
	character.move_and_slide()
	
	jumping = false
	
