extends CharacterBody2D

var speed = 150
var player_position
var target_position
var target2_position
var base_position
@onready var player = get_parent().get_node("player")
@onready var base = get_parent().get_node("Tree")
var coinScene = preload("res://Scenes/coin.tscn")
var medKitScene = preload("res://Scenes/med_kit.tscn")
var enemy_hp = 3
var particles
var hitanimation


func _ready():
	particles = $EnemyArea2D/GPUParticles2D


func _physics_process(_delta):
	
	base_position = base.position
	player_position = player.position
	target_position = (player_position - position).normalized()
	target2_position = (base_position - position).normalized()
	
	if position.distance_to(player_position) <300:
		look_at(player_position)
		velocity = Vector2(target_position * speed)
		move_and_slide()
	else:
		look_at(base_position)
		velocity = Vector2(target2_position * speed / 2)
		move_and_slide()
	
	if enemy_hp <= 0:
		die()
		
func die():
	
	var randomValue = randf_range(0, 100)  

	if randomValue < 50 && randomValue > 5:  
		var coinInstance = coinScene.instantiate()
		get_parent().add_child(coinInstance)
		coinInstance.position = position
		coinInstance.play_animation()
		
	
	if randomValue < 5:  
		var medKitInstance = medKitScene.instantiate()
		get_parent().add_child(medKitInstance)
		medKitInstance.position = position
			
	queue_free()
	if GlobalVar.playerscore > 50:
		GlobalVar.spawntimer = 1  #1.005
	GlobalVar.playerscore += 1

func _on_enemy_area_2d_area_entered(_area):
	enemy_hp -= 1
	particles.emitting = true
	$Sprite2D/AnimatedSprite2D.play("hitanim")
