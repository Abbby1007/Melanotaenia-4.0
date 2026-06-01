extends CharacterBody2D
# This variable updates the sprite's texture modulation when changed in the inspector


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


	#based on players input their color changes
	
	#When Q is pressed it changes to Orange
	if Input.is_action_just_pressed("orange"):
			modulate = Color.ORANGE
	
	#When e is pressed it changes to sea Green	
	if Input.is_action_just_pressed("green"):
			modulate = Color.GREEN
			
	#When R is pressed it changes to Purple
	if Input.is_action_just_pressed("purple"):
			modulate = Color.PURPLE
			
	#When S is pressed it changes to Yellow
	if Input.is_action_just_pressed("yellow"):
			modulate = Color.YELLOW
