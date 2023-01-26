extends Actor
class_name Player

enum Facing {E, NE, N, NW, W, SW, S, SE}
enum State {IDLE, ATTACKING, DODGING}

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	marg = 0
	health = 3
	acceleration = 750
	max_speed = 325
	friction = 2800
	velocity = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_state(delta)
	position.x = clamp(position.x, marg, (screen_size.x - marg))
	._physics_process(delta)

# Called every frame to change the velocity of the player according to input
func move_state(delta):
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	velocity = move_and_slide(velocity)
