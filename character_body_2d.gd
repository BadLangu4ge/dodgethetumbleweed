extends CharacterBody2D


const SPEED = 350.0
const JUMP_VELOCITY = -900.0

func _physics_process(_delta):
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * SPEED
	move_and_slide() # Handles collision automatically
