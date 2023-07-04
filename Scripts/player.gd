extends CharacterBody2D


var MAX_SPEED = 250
var ACCELERATION = 800
var FRICTION = 800

var bullet = preload("res://Scenes/Bullet.tscn")
var speed = 500
var bullet_speed = 1000
var fire_rate = 0.3
var can_fire = true



func _process(delta):
	
	GlobalVar.playerpositionx = position.x
	GlobalVar.playerpositiony = position.y
	GlobalVar.playerpositoin = position
	
	look_at(get_global_mouse_position())
	var mouse_pos = get_global_mouse_position()
	var cursor_positoin = Vector2(mouse_pos.x, mouse_pos.y)
	var dir = Vector2(cos(rotation), sin(rotation))
	
	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		var direction = (cursor_positoin - get_global_position().normalized())
		bullet_instance.apply_impulse(Vector2(dir*bullet_speed),Vector2())
		get_tree().get_root().add_child(bullet_instance)
		can_fire= false
		await (get_tree().create_timer(fire_rate).timeout)
		can_fire = true
		
		
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if Input.is_action_just_pressed("run"):
		MAX_SPEED = MAX_SPEED * 2 
		ACCELERATION = 800
	if Input.is_action_just_released("run"):
		MAX_SPEED = MAX_SPEED / 2
		ACCELERATION = 500
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move_and_slide()


func _on_player_hurtbox_area_entered(area):
	get_tree().change_scene_to_file("res://UI/GameOverUI.tscn")
	queue_free()
