extends Camera2D

var player

func _physics_process(_delta):
	position.x = GlobalVar.playerpositionx
	position.y = GlobalVar.playerpositiony
