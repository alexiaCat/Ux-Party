extends Control


onready var popup = get_node("MenuAhorcado")

const VOLUME_FRACTIONS := 50

onready var master_volume := $MenuAhorcado/TextureRect/VBoxContainer/vGral
onready var effects_volume := $MenuAhorcado/TextureRect/VBoxContainer3/vEffects
onready var music_volume := $MenuAhorcado/TextureRect/VBoxContainer2/vMusic

func _ready():
	master_volume.max_value = VOLUME_FRACTIONS
	master_volume.value = Userdata.get_config("volume_master") * VOLUME_FRACTIONS
	music_volume.max_value = VOLUME_FRACTIONS
	music_volume.value = Userdata.get_config("volume_music") * VOLUME_FRACTIONS
	effects_volume.max_value = VOLUME_FRACTIONS
	effects_volume.value = Userdata.get_config("volume_efects") * VOLUME_FRACTIONS


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_quit_button_up():
	popup.visible = true
	get_tree().get_nodes_in_group("teclado")[0].hide()
	get_tree().get_nodes_in_group("hangedtime")[0].stop()
	get_tree().get_nodes_in_group("hint")[0].disabled = true
	get_tree().get_nodes_in_group("btnquit")[0].disabled = true
	get_tree().get_nodes_in_group("btntuto")[0].disabled = true


func _on_btn_exit_button_up():
	Userdata.load_config()
	popup.visible = false
	get_tree().get_nodes_in_group("teclado")[0].show()
	get_tree().get_nodes_in_group("hangedtime")[0].start()
	get_tree().get_nodes_in_group("hint")[0].disabled = false
	get_tree().get_nodes_in_group("btnquit")[0].disabled = false
	get_tree().get_nodes_in_group("btntuto")[0].disabled = false


func _on_Salir_button_up():
	Userdata.load_config()
	Gamehandler.vidas_jugador -= 1
	get_tree().change_scene("res://main_map/Main_scene.tscn")


func _on_vGral_value_changed(value):
	Userdata.save_config("volume_master", value/VOLUME_FRACTIONS)


func _on_vMusic_value_changed(value):
	Userdata.save_config("volume_music", value/VOLUME_FRACTIONS)


func _on_vEffects_value_changed(value):
	Userdata.save_config("volume_efects", value/VOLUME_FRACTIONS)
