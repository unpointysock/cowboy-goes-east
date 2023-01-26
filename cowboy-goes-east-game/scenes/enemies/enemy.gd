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
	velocity = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass
	
# Called when the enemy first spawns into the map
func spawn(_delta):
	pass
	
# Called when the enemy is killed
func despawn(_delta):
	pass
