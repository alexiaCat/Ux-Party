extends Control


onready var popup = get_node("Modal_config")

const VOLUME_FRACTIONS := 0

onready var master_volume := $Modal_config/TextureRect/VBoxContainer/vGeneral
onready var music_volume := $Modal_config/TextureRect/VBoxContainer3/vMusica
onready var effects_volume := $Modal_config/TextureRect/VBoxContainer2/vEfectos

# Called when the node enters the scene tree for the first time.
func _ready():
	master_volume.max_value = VOLUME_FRACTIONS
	master_volume.value = Userdata.get_config("volume_master")
	music_volume.max_value = VOLUME_FRACTIONS
	music_volume.value = Userdata.get_config("volume_music") 
	effects_volume.max_value = VOLUME_FRACTIONS
	effects_volume.value = Userdata.get_config("volume_efects")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Config_button_button_up():
	popup.visible = true
	get_tree().get_nodes_in_group("escena")[0].visible = false


func _on_btn_exit_button_up():
	popup.visible = false
	Userdata.load_config()
	get_tree().get_nodes_in_group("escena")[0].visible = true


func _on_vGeneral_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)
	Userdata.save_config("volume_master", value)


func _on_vEfectos_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("EFECTOS"),value)
	Userdata.save_config("volume_efects", value)


func _on_vMusica_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("MUSICA"),value)
	Userdata.save_config("volume_music", value)
