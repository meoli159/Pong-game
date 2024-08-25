extends CharacterBody2D

@export var start_speed: int = 500
@export var accel: int = 50
@export var max_speed: int = 1500  # Exported for easy tweaking
var speed: int
var screen_size: Vector2
var dir : Vector2
const MAX_Y_VECTOR : float = 0.5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	

func new_ball() -> void:
	randomize()
	# Set initial velocity with a random direction
	velocity = Vector2([-1, 1][randi() % 2], [-0.8, 0.8][randi() % 2])
	position = Vector2(screen_size.x/2, screen_size.y / 2)
	speed = start_speed

func _physics_process(delta: float) -> void:
	# Move the ball and check for collisions
	var collision = move_and_collide(velocity * delta  * speed)
	if collision:
		var collider = collision.get_collider()
		if collider == $"../Player" or collider == $"../Enemy":
			speed = min(speed + accel, max_speed)  # Limit maximum speed
		velocity = velocity.bounce(collision.get_normal())
