extends Area2D

var speed = 800
var lado = 1

func _ready():
	pass


func setlado(ladonovo):
	lado = ladonovo
func _physics_process(delta):
	if(lado > 0):
		position.x += speed * delta
	else:
		position.x -= speed * delta


func _on_Laser_body_entered(body):
	if body.name != "Player":
		$Sprite.hide()
		$mortealien.play()
		body.morte()
