extends Control


onready var popup = get_node("MenuTrivia")

onready var master_volume := $MenuTrivia/TextureRect/VBoxContainer/vGral
onready var effects_volume := $MenuTrivia/TextureRect/VBoxContainer3/vEffects
onready var music_volume := $MenuTrivia/TextureRect/VBoxContainer2/vMusic

func _ready():
	Gamehandler.cargar_volumen()
	$MenuTrivia/TextureRect/VBoxContainer/vGral.value =  Gamehandler.masterxd
	$MenuTrivia/TextureRect/VBoxContainer3/vEffects.value = Gamehandler.effects
	$MenuTrivia/TextureRect/VBoxContainer2/vMusic.value = Gamehandler.music


func _on_Button_quit_button_up():
	popup.visible = true
	get_tree().get_nodes_in_group("timertrivia")[0].stop()
	get_tree().get_nodes_in_group("triviabtn")[0].disabled = true
	get_tree().get_nodes_in_group("button")[0].disabled = true
	get_tree().get_nodes_in_group("button")[1].disabled = true
	get_tree().get_nodes_in_group("button")[2].disabled = true
	get_tree().get_nodes_in_group("button")[3].disabled = true


func _on_btn_exit_button_up():
	Gamehandler.guardar_volumen()
	popup.visible = false
	get_tree().get_nodes_in_group("timertrivia")[0].start()
	get_tree().get_nodes_in_group("triviabtn")[0].disabled = false
	get_tree().get_nodes_in_group("button")[0].disabled = false
	get_tree().get_nodes_in_group("button")[1].disabled = false
	get_tree().get_nodes_in_group("button")[2].disabled = false
	get_tree().get_nodes_in_group("button")[3].disabled = false


func _on_vGral_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)
	Gamehandler.masterxd = value
	Gamehandler.guardar_volumen()


func _on_vMusic_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("MUSICA"),value)
	Gamehandler.music = value
	Gamehandler.guardar_volumen()


func _on_vEffects_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("EFECTOS"),value)
	Gamehandler.effects = value
	Gamehandler.guardar_volumen()


func _on_Salir_button_up():
	Gamehandler.guardar_volumen()
	Gamehandler.vidas_jugador -= 1
	Gamehandler.guardar_partida()
	get_tree().change_scene("res://main_map/Main_scene.tscn")
