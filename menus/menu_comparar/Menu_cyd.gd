extends Control


onready var popup = get_node("MenuCyd")
const VOLUME_FRACTIONS := 50

onready var master_volume := $MenuCyd/TextureRect/VBoxContainer/vGral
onready var effects_volume := $MenuCyd/TextureRect/VBoxContainer3/vEffects
onready var music_volume := $MenuCyd/TextureRect/VBoxContainer2/vMusic

# Called when the node enters the scene tree for the first time.
func _ready():
	master_volume.max_value = VOLUME_FRACTIONS
	master_volume.value = Userdata.get_config("volume_master") * VOLUME_FRACTIONS
	music_volume.max_value = VOLUME_FRACTIONS
	music_volume.value = Userdata.get_config("volume_music") * VOLUME_FRACTIONS
	effects_volume.max_value = VOLUME_FRACTIONS
	effects_volume.value = Userdata.get_config("volume_efects") * VOLUME_FRACTIONS




func _on_vGral_value_changed(value):
	Userdata.save_config("volume_master", value/VOLUME_FRACTIONS)


func _on_vMusic_value_changed(value):
	Userdata.save_config("volume_music", value/VOLUME_FRACTIONS)


func _on_vEffects_value_changed(value):
	Userdata.save_config("volume_efects", value/VOLUME_FRACTIONS)


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
	get_tree().change_scene("res://main_map/Main_scene.tscn")
