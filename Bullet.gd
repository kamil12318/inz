extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVar.playerscore > GlobalVar.highscore:
		GlobalVar.highscore = GlobalVar.playerscore


func _on_bullet_area_2d_area_entered(area):
	GlobalVar.spawntimer -= 0.005
	GlobalVar.playerscore += 1
	queue_free()
