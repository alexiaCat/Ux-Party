extends Control


onready var popup = get_node("MenuCyd")


onready var master_volume := $MenuCyd/TextureRect/VBoxContainer/vGral
onready var effects_volume := $MenuCyd/TextureRect/VBoxContainer3/vEffects
onready var music_volume := $MenuCyd/TextureRect/VBoxContainer2/vMusic

# Called when the node enters the scene tree for the first time.
func _ready():
	Gamehandler.cargar_volumen()
	$MenuCyd/TextureRect/VBoxContainer/vGral.value =  Gamehandler.masterxd
	$MenuCyd/TextureRect/VBoxContainer3/vEffects.value = Gamehandler.effects
	$MenuCyd/TextureRect/VBoxContainer2/vMusic.value = Gamehandler.music




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


func _on_Button_quit_pressed():
	popup.visible = true
	get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
	get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
	get_tree().get_nodes_in_group("cydtuto")[0].disabled = true
	get_tree().get_nodes_in_group("timercyd")[0].stop()
	get_tree().get_nodes_in_group("tiemporespuesta")[0].stop()


func _on_btn_exit_button_up():
	popup.visible = false
	Gamehandler.guardar_volumen()
	get_tree().get_nodes_in_group("botoncyd")[0].disabled = false
	get_tree().get_nodes_in_group("botoncyd")[1].disabled = false
	get_tree().get_nodes_in_group("cydtuto")[0].disabled = false
	get_tree().get_nodes_in_group("timercyd")[0].start()
	get_tree().get_nodes_in_group("tiemporespuesta")[0].start()
	


func _on_Salir_button_up():
	Gamehandler.guardar_volumen()
	Gamehandler.vidas_jugador -= 1
	Gamehandler.guardar_partida()
	get_tree().change_scene("res://main_map/Main_scene.tscn")
