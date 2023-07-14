extends Node2D

const SPAWN_RADIUS = 1300

var enemy_scene = preload("res://Scripts/Enemy.gd")
@onready var timer = get_node("SpawnTimer")

func _process(delta):
	timer.wait_time = GlobalVar.spawntimer
	
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
	else:
		get_tree().paused = false
	
func _ready():
	if GlobalVar.onload == 0:
		GlobalVar.playerscore = 0
	
	GlobalVar.spawntimer = 2
	GlobalVar.player_hp  = 6
	GlobalVar.money = 0
	
func spawn_enemy():
	var enemy = load("res://Scenes/enemy.tscn").instantiate()
	enemy.name = "enemy"
	add_child(enemy)
	
	var spawn_angle = randf_range(0, 2 * 3.14)
	var spawn_position = GlobalVar.playerpositoin + Vector2(cos(spawn_angle), sin(spawn_angle)) * SPAWN_RADIUS
	enemy.position = spawn_position
	
func rand_range(min, max):
	return randf_range(1000, max)
	
func _on_timer_timeout():
	spawn_enemy()


