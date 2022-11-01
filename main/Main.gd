extends Node2D

var sounds_bus = AudioServer.get_bus_index("Efectos")
var sounds_bus2 = AudioServer.get_bus_index("Musica")

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



func _on_Msica_toggled(button_pressed):
	if (button_pressed == true):
		Gamehandler.effects = true
		AudioServer.set_bus_volume_db(sounds_bus2, -80.0)
	else:
		Gamehandler.effects = false
		AudioServer.set_bus_volume_db(sounds_bus2, 0)


func _on_btn_acept_pressed():
	new_file.hide()
	Gamehandler.nameplayer = $nombre_usuario/TextureRect/inputName.text
	get_tree().change_scene("res://main_map/Main_scene.tscn")
