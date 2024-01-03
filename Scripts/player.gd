extends CharacterBody2D

var MAX_SPEED = 250
var ACCELERATION = 800
var FRICTION = 800

var bullet = preload("res://Scenes/Bullet.tscn")
var speed = 500

var stamina = 100

var bullet_speed = 800
var fire_rate = 0.5
var can_fire = true
var sprint = false


func _process(_delta):
	
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
		var _direction = (cursor_positoin - get_global_position().normalized())
		bullet_instance.apply_impulse(Vector2(dir*bullet_speed),Vector2())
		get_tree().get_root().add_child(bullet_instance)
		can_fire= false
		await (get_tree().create_timer(fire_rate).timeout)
		can_fire = true
		
	if GlobalVar.player_hp == 0:
		get_tree().change_scene_to_file("res://UI/GameOverUI.tscn")
		set_process(false)
		queue_free()
		
		

		
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	
	
	

	if Input.is_action_just_pressed("run") && stamina > 6:
		sprint = true
		MAX_SPEED = 500
		ACCELERATION = 800
		while stamina > 5 && sprint == true:
			stamina = stamina - 5
			sprint = Input.is_action_pressed("run")  # nei działa do poprawki 
			await get_tree().create_timer(0.1).timeout
		sprint = false
				
	if Input.is_action_just_released("run"):
		sprint = false
		@warning_ignore("integer_division")
		MAX_SPEED = 250
		ACCELERATION = 500

	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move_and_slide()
	
	print(stamina)

func _on_player_hurtbox_area_entered(_area):
	while true:
		GlobalVar.player_hp -=1
		await get_tree().create_timer(1.0).timeout
	
	
	
func _on_speed_button_pressed():
	if GlobalVar.money >= 5:
		GlobalVar.money -= 5
		fire_rate -= 0.05
		bullet_speed += 50
		print(fire_rate)

func _on_bullet_speed_button_pressed():
	if GlobalVar.money >= 5:
		GlobalVar.money -= 5
		bullet_speed += 1000

