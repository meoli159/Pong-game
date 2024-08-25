extends CharacterBody2D

@export var speed = 700
var screen_size
var ball_detect: Vector2
var dist : float
var p_width : float
var ball
var move_by
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size.x
	p_width = self.get_viewport_rect().size.x
	ball = get_parent().get_node("Ball")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dumb_ai(delta)
	move_and_slide()
	
func dumb_ai(delta) -> void:
	
	dist = position.x - ball.position.x
	
	if abs(dist) > speed * delta:
		move_by = speed * delta * (dist/abs(dist))
	else :
		move_by = dist
	position.x -= move_by
	position.y = get_parent().enemy_posision_y
	
