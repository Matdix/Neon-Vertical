class_name JumpState extends State

var JUMP_SPEED = -600
var walk_speed = 20

func enter() -> void:
	character.velocity.y = JUMP_SPEED
	animation_player.play("jump")

func physics_update(delta: float) -> void:
	character.velocity.y += character.get_gravity().y * delta
	if character.velocity.y > 0:
		state_machine.change_state("fallingstate")
	
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
		else:
			state_machine.change_state("idlestate")
