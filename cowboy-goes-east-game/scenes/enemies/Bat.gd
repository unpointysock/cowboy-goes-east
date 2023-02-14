extends Enemy
class_name Bat

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	marg = 0
	health = 500
	acceleration = 200
	max_speed = 325
	friction = 2800
	velocity = Vector2.ZERO
	spawn_delay = 2.0
	spawn_radius = 500.0
	
	spawn()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	._physics_process(delta)
	
	#FOR TESTING
	health -= 1
	
	if health <= 0:
		despawn()

# Called when the enemy first spawns into the map
func spawn():
	self.global_position = Vector2(rand_range(-spawn_radius, spawn_radius), rand_range(-spawn_radius, spawn_radius))
	.spawn()
	
# Called when the enemy is killed
func despawn():
	.despawn()
