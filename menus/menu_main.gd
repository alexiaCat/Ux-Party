extends Control

onready var popup = get_node("Modal_config")

onready var master_volume := $Modal_config/TextureRect/VBoxContainer/vGeneral
onready var music_volume := $Modal_config/TextureRect/VBoxContainer3/vMusica
onready var effects_volume := $Modal_config/TextureRect/VBoxContainer2/vEfectos

# Called when the node enters the scene tree for the first time.
func _ready():
	Gamehandler.cargar_volumen()
	$Modal_config/TextureRect/VBoxContainer/vGeneral.value =  Gamehandler.masterxd
	$Modal_config/TextureRect/VBoxContainer2/vEfectos.value = Gamehandler.effects
	$Modal_config/TextureRect/VBoxContainer3/vMusica.value = Gamehandler.music


func _on_Config_button_up():
	popup.visible = true


func _on_btn_exit_button_up():
	popup.visible = false
	Gamehandler.guardar_volumen()


func _on_vGeneral_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)
	Gamehandler.masterxd = value
	Gamehandler.guardar_volumen()


func _on_vEfectos_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("EFECTOS"),value)
	Gamehandler.effects = value
	Gamehandler.guardar_volumen()


func _on_vMusica_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("MUSICA"),value)
	Gamehandler.music = value
	Gamehandler.guardar_volumen()
