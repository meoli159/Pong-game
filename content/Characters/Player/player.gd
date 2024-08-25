extends CharacterBody2D

@export var speed = 500.0
var screen_size : Vector2
var direction = Vector2()
var dragging : bool = false
var p_width : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	p_width = self.get_viewport_rect().size
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_input()
	move_and_collide(velocity * delta)
	

func get_input():
	var input_direction = Input.get_axis("move_left","move_right")
	velocity.x =  input_direction * speed

	
func _input(event: InputEvent):
	if event is InputEventScreenDrag  :
		# While dragging, move the sprite with the mouse.
		var new_position = event.position	
		new_position.x = clamp(new_position.x, 0, screen_size.x)
		new_position.y = get_parent().player_posision_y
		self.position = new_position	

func _on_touch_screen_button_pressed() -> void:
	dragging = true
	

func _on_touch_screen_button_released() -> void:
	dragging = false
