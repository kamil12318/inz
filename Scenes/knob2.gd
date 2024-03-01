extends Sprite2D

@onready var joy = $".."

var pressing = false

@export var maxLength = 300

var deadzone = 5 



func _ready():
	
	deadzone = joy.deadzone
	maxLength *= joy.scale.x

func _process(delta):
	
	if pressing:
		if get_global_mouse_position().distance_to(joy.global_position) <= maxLength:
			global_position = get_global_mouse_position()
		else:
			var angle = joy.global_position.angle_to_point(get_global_mouse_position())
			global_position.x = joy.global_position.x + cos(angle)*maxLength
			global_position.y = joy.global_position.y + sin(angle)*maxLength
			
		calculateVector()
	else:
			global_position = lerp(global_position, joy.global_position, delta*50)
			joy.posVector = Vector2(0,0)

func calculateVector():
	if abs((global_position.x - joy.global_position.x)) >= deadzone:
		joy.posVector.x = (global_position.x - joy.global_position.x)/maxLength
	if abs((global_position.y - joy.global_position.x)) >= deadzone:
		joy.posVector.y = (global_position.y - joy.global_position.y)/maxLength
		
func _on_button_button_down():
	pressing = true


func _on_button_button_up():
	pressing = false
