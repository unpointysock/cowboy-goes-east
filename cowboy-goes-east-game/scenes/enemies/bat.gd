extends "res://scenes/enemies/enemy.gd"

const MIN_CHASE_DISTANCE = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	velocity = Vector2.ZERO
#	below values will overwrite the export vars
#	better to use export vars for easier tuning
#	marg = 0
#	health = 1
#	acceleration = 800
#	maxSpeed = 325
#	friction = 2800
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var target
	if PlayerData.player_pos:
		target = PlayerData.player_pos
		chase(delta, target)

# Called in __physics_process() to translate the enem
func __move_state(_delta):
	# we can work on state machines at some point also!
	pass

func chase(delta, target):	
	velocity = position.direction_to(target) * ((acceleration * delta) + (friction * delta))
	if position.distance_to(target) > MIN_CHASE_DISTANCE:
		velocity = move_and_slide(velocity)
