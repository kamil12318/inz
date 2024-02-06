extends Sprite2D

@onready var joystick = $".."

var pressing = false

@export var maxLenght = 80
@export var deadzone =5 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pressing:
		if get_global_mouse_position().distance_to(joystick.global_position) <= maxLenght:
			global_position = get_global_mouse_position()
		else:
			var angle = joystick.global_position.angle_to_point(get_global_mouse_position())
			global_position.x = joystick.global_position.x + cos(angle)*maxLenght
			global_position.y = joystick.global_position.y + sin(angle)*maxLenght
		calculateVector()
	else:
			global_position = lerp(global_position, joystick.global_position, delta*10)
			joystick.posVector = Vector2(0,0)
		

func calculateVector():
	if abs((global_position.x - joystick.global_position.x)) >= deadzone:
		joystick.posVector.x = (global_position.x - joystick.global_position.x)/maxLenght
	if abs((global_position.y - joystick.global_position.x)) >= deadzone:
		joystick.posVector.y = (global_position.x - joystick.global_position.y)/maxLenght
func _on_button_button_down():
	pressing = true


func _on_button_button_up():
	pressing = false
