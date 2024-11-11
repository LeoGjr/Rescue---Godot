extends Node2D

var ali = preload("res://Scenes/Alien.tscn")
var astro = preload("res://Scenes/Astronauta.tscn")
var comb = preload("res://Scenes/Combustivel.tscn")


func _ready():
	$Player.position.x = 2000
func _physics_process(delta):
	$Camera2D.position.x = $Player.position.x
	$Camera2D.position.y = 250


func _on_geraalien_timeout():
	var novoalien = ali.instance()
	add_child(novoalien)
	novoalien.position.x = rand_range(0, 4000)
	novoalien.position.y = rand_range(0, 480)


func _on_geraastronauta_timeout():
	var novoastronauta = astro.instance()
	add_child(novoastronauta)
	novoastronauta.position.x = rand_range(330, 3600)
	novoastronauta.position.y = rand_range(0, 480)


func _on_geracombustivel_timeout():
	var novocombustivel = comb.instance()
	add_child(novocombustivel)
	novocombustivel.position.x = rand_range(0, 3600)
	novocombustivel.position.y = rand_range(0, 480)


func _on_fase_timeout():
	if $geraalien.wait_time > 0.4:
		$geraalien.wait_time -= 0.02
		$geraastronauta.wait_time += 0.02
	if $geracombustivel.wait_time < 8.4:
		$geracombustivel.wait_time += 0.4


func _on_reinicio_timeout():
	get_tree().reload_current_scene()


func _on_Player_morreu():
	$reinicio.start()
