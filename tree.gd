extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#GlobalVar.basepositionx = position.x
	#GlobalVar.basepositiony = position.y
	#GlobalVar.basepositoin = position
	pass


func _on_area_2d_area_entered(_area):
	print(GlobalVar.base_hp)
	await get_tree().create_timer(0.5).timeout
	GlobalVar.base_hp -=1 
	
