extends Control


onready var popup = get_node("MenuCyd")
const VOLUME_FRACTIONS := 0

onready var master_volume := $MenuCyd/TextureRect/VBoxContainer/vGral
onready var effects_volume := $MenuCyd/TextureRect/VBoxContainer3/vEffects
onready var music_volume := $MenuCyd/TextureRect/VBoxContainer2/vMusic

# Called when the node enters the scene tree for the first time.
func _ready():
	master_volume.max_value = VOLUME_FRACTIONS
	master_volume.value = Userdata.get_config("volume_master")
	music_volume.max_value = VOLUME_FRACTIONS
	music_volume.value = Userdata.get_config("volume_music")
	effects_volume.max_value = VOLUME_FRACTIONS
	effects_volume.value = Userdata.get_config("volume_efects")




func _on_vGral_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)
	Userdata.save_config("volume_master", value)


func _on_vMusic_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("MUSIC"),value)
	Userdata.save_config("volume_music", value)


func _on_vEffects_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("EFECTOS"),value)
	Userdata.save_config("volume_efects", value)


func _on_Button_quit_pressed():
	popup.visible = true
	get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
	get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
	get_tree().get_nodes_in_group("cydtuto")[0].disabled = true
	get_tree().get_nodes_in_group("timercyd")[0].stop()
	get_tree().get_nodes_in_group("tiemporespuesta")[0].stop()


func _on_btn_exit_button_up():
	popup.visible = false
	get_tree().get_nodes_in_group("botoncyd")[0].disabled = false
	get_tree().get_nodes_in_group("botoncyd")[1].disabled = false
	get_tree().get_nodes_in_group("cydtuto")[0].disabled = false
	get_tree().get_nodes_in_group("timercyd")[0].start()
	get_tree().get_nodes_in_group("tiemporespuesta")[0].start()
	Userdata.load_config()


func _on_Salir_button_up():
	Userdata.load_config()
	Gamehandler.vidas_jugador -= 1
	Gamehandler.guardar_partida()
	get_tree().change_scene("res://main_map/Main_scene.tscn")
