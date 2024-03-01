extends CharacterBody2D

var MAX_SPEED = 250
var ACCELERATION = 800
var FRICTION = 800


@onready var joystick = $"../Camera2D/UserInterface/Joystick"



var bullet = preload("res://Scenes/Bullet.tscn")
var speed = 400

var stamina = 100

var bullet_speed = 800
var fire_rate = 0.5
var can_fire = true
var fire_button = false

@onready var timer = get_node("Timer")

var enemy_touching = false

func _process(_delta):
	
	GlobalVar.playerpositionx = position.x
	GlobalVar.playerpositiony = position.y
	GlobalVar.playerpositoin = position
	
	
	var vector = Vector2(joystick.posVector)
	var angle = vector.angle()
	
	
	var mouse_pos = get_global_mouse_position()
	var cursor_positoin = Vector2(mouse_pos.x, mouse_pos.y)
	var dir = Vector2(cos(rotation), sin(rotation))

	if (Input.is_action_pressed("fire") or fire_button) and can_fire:
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		var _direction = (cursor_positoin - get_global_position().normalized())
		bullet_instance.apply_impulse(Vector2(dir*bullet_speed),Vector2())
		get_tree().get_root().add_child(bullet_instance)
		can_fire= false
		await (get_tree().create_timer(fire_rate).timeout)
		can_fire = true
		
	if GlobalVar.player_hp == 0 or GlobalVar.base_hp == 0:
		get_tree().change_scene_to_file("res://UI/GameOverUI.tscn")
		set_process(false)
		queue_free()
		
		
func _physics_process(delta):
	
	var direction = joystick.posVector
	
	if direction: 
		velocity = direction * speed
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	look_at(position + direction)
	move_and_slide()
	


func _on_player_hurtbox_area_entered(_area):
		await get_tree().create_timer(0.5).timeout
		GlobalVar.player_hp -=1
	
	
func _on_speed_button_pressed():
	if GlobalVar.money >= 5:
		GlobalVar.money -= 5
		fire_rate -= 0.05
	

func _on_bullet_speed_button_pressed():
	if GlobalVar.money >= 5:
		GlobalVar.money -= 5
		bullet_speed += 500



func _on_player_hurtbox_area_exited(area):
	enemy_touching = false





func _on_fire_button_button_down():
	fire_button = true


func _on_fire_button_button_up():
	fire_button = false
