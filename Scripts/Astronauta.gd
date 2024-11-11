extends Area2D

func _ready():
	pass


func _on_Astronauta_body_entered(body):
	if body.name == "Player":
		body.salva()
		queue_free()
