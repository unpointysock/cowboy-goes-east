extends Actor
class_name Enemy

export var spawn_delay: float
export var spawn_radius: float

onready var player = get_node("/root/main/game/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	velocity = Vector2.ZERO

	
func _physics_process(delta):
	var direction = (player.global_position - global_position).normalized()
	velocity = velocity.move_toward(direction * max_speed, acceleration * delta)
	move_and_slide(velocity)

#For when an enemy spawns in (assumes it has a 'spawn' animation)
func spawn():
	var animation_player = self.get_node("AnimatedSprite")
	animation_player.play("spawn")
	
# Called when the enemy is killed (assumes it has a 'despawn' animation)
func despawn():
	var animation_player = self.get_node("AnimatedSprite")
	animation_player.play("despawn")
	
	queue_free()
