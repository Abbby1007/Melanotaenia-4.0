extends RigidBody2D

#set the speed value in the inspector
#@export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	##The player's movement vector
	#var velocity = Vector2.ZERO 
	#
	##move right
	## Press Right key or "D"
	#if Input.is_action_pressed("move_right"):
		#velocity.x += 1
		#
	##move left
	## Press left key or "A"
	#if Input.is_action_pressed("move_left"):
		#velocity.x -= 1
		#
	##Jump
	##Space Bar, up arrow or "W"
	#if Input.is_action_pressed("Jump"):
		#velocity.y += 1
		
