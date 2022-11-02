extends Node2D


onready var new_file = $nombre_usuario

func _ready():
	pass

func _on_Play_button_pressed():
	if(Gamehandler.first_time == true):
		get_tree().get_nodes_in_group("escena")[0].visible = false
		new_file.show()
		Gamehandler.first_time = false
	else:
		get_tree().change_scene("res://main_map/Main_scene.tscn")



func _on_btn_acept_pressed():
	new_file.hide()
	Gamehandler.nameplayer = $nombre_usuario/TextureRect/inputName.text
	get_tree().change_scene("res://main_map/Main_scene.tscn")

