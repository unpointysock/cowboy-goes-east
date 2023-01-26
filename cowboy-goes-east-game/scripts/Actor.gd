extends KinematicBody2D
class_name Actor

var screen_size : Vector2
var marg

export (int) var health
export (int) var acceleration
export (int) var max_speed
export (int) var friction

var velocity : Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = move_and_slide(velocity)
