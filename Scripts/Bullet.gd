extends RigidBody2D

func _process(_delta):
	if GlobalVar.playerscore > GlobalVar.highscore:
		GlobalVar.highscore = GlobalVar.playerscore
		
func _on_bullet_area_2d_area_entered(_area):
	queue_free()
