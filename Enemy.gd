extends CharacterBody2D

var speed = 150
var player_position
var target_position
@onready var player = get_parent().get_node("player")

func _physics_process(delta):
	
	player_position = player.position
	target_position = (player_position - position).normalized()
	
	if position.distance_to(player_position) >1:
		look_at(player_position)
		velocity = Vector2(target_position * speed)
		move_and_slide()


func _on_enemy_area_2d_area_entered(area):
	
	#przeciwnik umiera jakiś dead animacja 
	queue_free()
