extends Actor
class_name Enemy


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	velocity = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
	
# Called when the enemy first spawns into the map
func spawn(delta):
	pass
	
# Called when the enemy is killed
func despawn(delta):
	pass
