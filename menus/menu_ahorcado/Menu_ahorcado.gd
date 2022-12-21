extends Control

onready var popup = get_node("MenuAhorcado")


onready var master_volume := $MenuAhorcado/TextureRect/VBoxContainer/vGral
onready var effects_volume := $MenuAhorcado/TextureRect/VBoxContainer3/vEffects
onready var music_volume := $MenuAhorcado/TextureRect/VBoxContainer2/vMusic


func _ready():
	Gamehandler.cargar_volumen()
	$MenuAhorcado/TextureRect/VBoxContainer/vGral.value = Gamehandler.masterxd
	$MenuAhorcado/TextureRect/VBoxContainer2/vMusic.value = Gamehandler.music
	$MenuAhorcado/TextureRect/VBoxContainer3/vEffects.value = Gamehandler.effects


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
	Gamehandler.guardar_volumen()
	popup.visible = false
	get_tree().get_nodes_in_group("teclado")[0].show()
	get_tree().get_nodes_in_group("hangedtime")[0].start()
	get_tree().get_nodes_in_group("hint")[0].disabled = false
	get_tree().get_nodes_in_group("btnquit")[0].disabled = false
	get_tree().get_nodes_in_group("btntuto")[0].disabled = false


func _on_Salir_button_up():
	Gamehandler.perdiunavida = 1
	get_tree().change_scene("res://main_map/Main_scene.tscn")


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
