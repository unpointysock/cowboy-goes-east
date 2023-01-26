extends Enemy
class_name Bat

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	marg = 0
	health = 1
	acceleration = 200
	max_speed = 325
	friction = 2800
	velocity = Vector2.ZERO
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#chase(delta, playerSingleton)
	pass

# Called in __physics_process() to translate the enem
func __move_state(delta):
	pass
	
func chase(delta, player):
	velocity = velocity.move_toward(player.velocity, acceleration * delta)
	velocity  = move_and_slide(velocity)
