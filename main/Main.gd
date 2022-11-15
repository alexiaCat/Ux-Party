extends Node2D


onready var new_file = $nombre_usuario

func _ready():
	Gamehandler.cargar_datos()

func _on_Play_button_pressed():
	if(Gamehandler.first_time == 0):
		get_tree().get_nodes_in_group("escena")[0].visible = false
		new_file.show()
		Gamehandler.first_time = 100
		Gamehandler.guardar_datos()
	else:
		get_tree().change_scene("res://main_map/Main_scene.tscn")



func _on_btn_acept_pressed():
	if $nombre_usuario/TextureRect/inputName.text.length() > 1:
		new_file.hide()
		Gamehandler.nameplayer = $nombre_usuario/TextureRect/inputName.text
		$nombre_usuario/TextureRect/error.hide()
		Gamehandler.guardar_partida()
		get_tree().change_scene("res://main_map/Main_scene.tscn")
	else:
		$nombre_usuario/TextureRect/error.show()
		print("debe ingresar minimo dos caracteres")
