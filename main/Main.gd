extends Node2D

var sounds_bus = AudioServer.get_bus_index("Efectos")
var sounds_bus2 = AudioServer.get_bus_index("Musica")
onready var popu = get_node("nombre_usuario/Window_name")


func _ready():
	pass

func _on_Play_button_pressed():
	if(Gamehandler.first_time == true):
		popu.visible = true
		get_tree().get_nodes_in_group("escena")[0].visible = false
		Gamehandler.first_time = false
	else:
		get_tree().change_scene("res://main_map/Main_scene.tscn")


func _on_inputName_text_entered(new_text):
	Gamehandler.nameplayer = new_text

func _on_btn_acept_button_up():
	get_tree().change_scene("res://main_map/Main_scene.tscn")


func _on_inputName_text_changed(new_text):
	Gamehandler.nameplayer = new_text


func _on_Msica_toggled(button_pressed):
	if (button_pressed == true):
		Gamehandler.effects = button_pressed
		print(button_pressed)
		AudioServer.set_bus_volume_db(sounds_bus2, -80.0)
	else:
		print(button_pressed)
		Gamehandler.effects = button_pressed
		AudioServer.set_bus_volume_db(sounds_bus2, 0)
