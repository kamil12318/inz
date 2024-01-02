extends Node2D


func _on_area_2d_area_entered(_area):
	queue_free()
	GlobalVar.money += 1 
	
func play_animation():
	$coinanim.play("CoinAnim")
	$GPUParticles2D.emitting = true
