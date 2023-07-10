extends RigidBody2D

func _process(delta):
	if GlobalVar.playerscore > GlobalVar.highscore:
		GlobalVar.highscore = GlobalVar.playerscore
		
func _on_bullet_area_2d_area_entered(area):
	GlobalVar.spawntimer /= 1.02
	GlobalVar.playerscore += 1
	queue_free()
