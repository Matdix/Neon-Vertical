class_name WalkState extends State

var walk_speed = 20

func physics_update(delta: float) -> void:
	var direction = Input.get_axis("left", "right")
	
	if direction == 0:
		state_machine.change_state("idlestate")
		return
	
	character.velocity.x = walk_speed * direction * 1000 * delta
	character.move_and_slide()
	
	if !character.is_on_floor():
		state_machine.change_state("fallingstate")

func handle_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state("jumpstate")
