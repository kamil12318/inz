extends CharacterBody2D

var speed = 150
var player_position
var target_position
@onready var player = get_parent().get_node("player")
var coinScene = preload("res://Scenes/coin.tscn")
var medKitScene = preload("res://Scenes/med_kit.tscn")
var enemy_hp = 3



func _physics_process(_delta):
	
	player_position = player.position
	target_position = (player_position - position).normalized()
	
	if position.distance_to(player_position) >1:
		look_at(player_position)
		velocity = Vector2(target_position * speed)
		move_and_slide()
	
	if enemy_hp <= 0:
		die()
		
func die():
	
	var randomValue = randf_range(0, 100)  # Wylosuj wartość pomiędzy 0 a 1

	if randomValue < 50:  # Zmień wartość 0.5 na dowolny inny próg prawdopodobieństwa
		var coinInstance = coinScene.instantiate()
		get_parent().add_child(coinInstance)
		coinInstance.position = position
	
	if randomValue < 5:  # Zmień wartość 0.5 na dowolny inny próg prawdopodobieństwa
		var medKitInstance = medKitScene.instantiate()
		get_parent().add_child(medKitInstance)
		medKitInstance.position = position
			
	queue_free()
	GlobalVar.spawntimer /= 1.005
	GlobalVar.playerscore += 1

func _on_enemy_area_2d_area_entered(_area):
	enemy_hp -= 1
