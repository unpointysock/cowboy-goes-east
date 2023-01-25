extends KinematicBody2D

var screen_size : Vector2
export (int) var marg

export (int) var health
export (int) var acceleration
export (int) var maxSpeed
export (int) var friction

var velocity : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	marg = 0
	health = 3
	acceleration = 750
	maxSpeed = 325
	friction = 2800
	velocity = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_state(delta)
	position.x = clamp(position.x, marg, (screen_size.x - marg))

# Called every frame to change the velocity of the player according to input
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * maxSpeed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	velocity = move_and_slide(velocity)
