extends "res://scenes/enemies/enemy.gd"

#onready var playerSingleton = get_tree().get_root().find_node("player")

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	marg = 0
	health = 1
	acceleration = 200
	maxSpeed = 325
	friction = 2800
	velocity = Vector2.ZERO
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	#chase(delta, playerSingleton)
	pass

# Called in __physics_process() to translate the enem
func __move_state(_delta):
	pass
	
func chase(delta, player):
	velocity = velocity.move_toward(player.velocity, acceleration * delta)
	velocity  = move_and_slide(velocity)
