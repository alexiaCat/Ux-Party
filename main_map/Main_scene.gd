extends Node2D
export(Texture) var past_level
export(AudioStream) var music
onready var new_file = $iniciarNivel

var label_node


# Called when the node enters the scene tree for the first time.
func _ready():
	Gamehandler.cargar_partida()
	hay_vidas()
	pintarestrellasmapa()
	Gamehandler.update_puntajeacumulado()
	Gamehandler.update_nombrejugador()
	change_icons()
	mostrarprimertutorial()
	
func hay_vidas():
	if(Gamehandler.vidas_jugador < 5):
		Gamehandler.recargarvidas()
	else:
		print("no hacer nada")
	
func pintarestrellasmapa():
	paint_starslvl1()
	paint_starslvl2()
	paint_starslvl3()
	paint_starslvl4()
	paint_starslvl5()
	paint_starslvl6()
	paint_starslvl7()
	paint_starslvl8()
	paint_starslvl9()

#1, 4 y 7 ahorcado
func paint_starslvl1():
	if (Gamehandler.pnivel1 > 224 && Gamehandler.pnivel1 < 389):
		print("pinta 1 sola estrella")
		$mapa_star/estrellas/uno/star1.show()
	elif(Gamehandler.pnivel1 > 389 && Gamehandler.pnivel1 < 499):
		print("pinta 2 estrellas")
		$mapa_star/estrellas/uno/star1.show()
		$mapa_star/estrellas/dos/star2.show()
	elif(Gamehandler.pnivel1 == 500):
		print("pinta 3 estrellas")
		$mapa_star/estrellas/uno/star1.show()
		$mapa_star/estrellas/dos/star2.show()
		$mapa_star/estrellas/tres/start3.show()

func paint_starslvl2():
	if (Gamehandler.pnivel2 > 199 && Gamehandler.pnivel2 < 299):
		print("pinta 1 sola estrella")
		$mapa_star/estrellas2/uno/star1.show()
	elif(Gamehandler.pnivel2 > 299 && Gamehandler.pnivel2 < 499):
		print("pinta 2 estrellas")
		$mapa_star/estrellas2/uno/star1.show()
		$mapa_star/estrellas2/dos/star2.show()
	elif(Gamehandler.pnivel2 == 500):
		print("pinta 3 estrellas")
		$mapa_star/estrellas2/uno/star1.show()
		$mapa_star/estrellas2/dos/star2.show()
		$mapa_star/estrellas2/tres/start3.show()

func paint_starslvl3():
	if (Gamehandler.pnivel3 > 199 && Gamehandler.pnivel3 < 299):
		print("pinta 1 sola estrella")
		$mapa_star/estrellas3/uno/star1.show()
	elif(Gamehandler.pnivel3 > 299 && Gamehandler.pnivel3 < 499):
		print("pinta 2 estrellas")
		$mapa_star/estrellas3/uno/star1.show()
		$mapa_star/estrellas3/dos/star2.show()
	elif(Gamehandler.pnivel3 == 500):
		print("pinta 3 estrellas")
		$mapa_star/estrellas3/uno/star1.show()
		$mapa_star/estrellas3/dos/star2.show()
		$mapa_star/estrellas3/tres/start3.show()
		
func paint_starslvl4():
	if (Gamehandler.pnivel4 > 224 && Gamehandler.pnivel4 < 389):
		print("pinta 1 sola estrella")
		$mapa_star/estrellas4/uno/star1.show()
	elif(Gamehandler.pnivel4 > 389 && Gamehandler.pnivel4 < 499):
		print("pinta 2 estrellas")
		$mapa_star/estrellas4/uno/star1.show()
		$mapa_star/estrellas4/dos/star2.show()
	elif(Gamehandler.pnivel4 == 500):
		print("pinta 3 estrellas")
		$mapa_star/estrellas4/uno/star1.show()
		$mapa_star/estrellas4/dos/star2.show()
		$mapa_star/estrellas4/tres/start3.show()

func paint_starslvl5():
	if (Gamehandler.pnivel5 > 199 && Gamehandler.pnivel5 < 299):
		print("pinta 1 sola estrella")
		$mapa_star/estrellas5/uno/star1.show()
	elif(Gamehandler.pnivel5 > 299 && Gamehandler.pnivel5 < 499):
		print("pinta 2 estrellas")
		$mapa_star/estrellas5/uno/star1.show()
		$mapa_star/estrellas5/dos/star2.show()
	elif(Gamehandler.pnivel5 == 500):
		print("pinta 3 estrellas")
		$mapa_star/estrellas5/uno/star1.show()
		$mapa_star/estrellas5/dos/star2.show()
		$mapa_star/estrellas5/tres/start3.show()

func paint_starslvl6():
	if (Gamehandler.pnivel6 > 199 && Gamehandler.pnivel6 < 299):
		print("pinta 1 sola estrella")
		$mapa_star/estrellas6/uno/star1.show()
	elif(Gamehandler.pnivel6 > 299 && Gamehandler.pnivel6 < 499):
		print("pinta 2 estrellas")
		$mapa_star/estrellas6/uno/star1.show()
		$mapa_star/estrellas6/dos/star2.show()
	elif(Gamehandler.pnivel6 == 500):
		print("pinta 3 estrellas")
		$mapa_star/estrellas6/uno/star1.show()
		$mapa_star/estrellas6/dos/star2.show()
		$mapa_star/estrellas6/tres/start3.show()

func paint_starslvl7():
	if (Gamehandler.pnivel7 > 224 && Gamehandler.pnivel7 < 389):
		print("pinta 1 sola estrella")
		$mapa_star/estrellas7/uno/star1.show()
	elif(Gamehandler.pnivel7 > 389 && Gamehandler.pnivel7 < 499):
		print("pinta 2 estrellas")
		$mapa_star/estrellas7/uno/star1.show()
		$mapa_star/estrellas7/dos/star2.show()
	elif(Gamehandler.pnivel7 == 500):
		print("pinta 3 estrellas")
		$mapa_star/estrellas7/uno/star1.show()
		$mapa_star/estrellas7/dos/star2.show()
		$mapa_star/estrellas7/tres/start3.show()

func paint_starslvl8():
	if (Gamehandler.pnivel8 > 199 && Gamehandler.pnivel8 < 299):
		print("pinta 1 sola estrella")
		$mapa_star/estrellas8/uno/star1.show()
	elif(Gamehandler.pnivel8 > 299 && Gamehandler.pnivel8 < 499):
		print("pinta 2 estrellas")
		$mapa_star/estrellas8/uno/star1.show()
		$mapa_star/estrellas8/dos/star2.show()
	elif(Gamehandler.pnivel8 == 500):
		print("pinta 3 estrellas")
		$mapa_star/estrellas8/uno/star1.show()
		$mapa_star/estrellas8/dos/star2.show()
		$mapa_star/estrellas8/tres/start3.show()

func paint_starslvl9():
	if (Gamehandler.pnivel9 > 199 && Gamehandler.pnivel9 < 299):
		print("pinta 1 sola estrella")
		$mapa_star/estrellas9/uno/star1.show()
	elif(Gamehandler.pnivel9 > 299 && Gamehandler.pnivel9 < 499):
		print("pinta 2 estrellas")
		$mapa_star/estrellas9/uno/star1.show()
		$mapa_star/estrellas9/dos/star2.show()
	elif(Gamehandler.pnivel9 == 500):
		print("pinta 3 estrellas")
		$mapa_star/estrellas9/uno/star1.show()
		$mapa_star/estrellas9/dos/star2.show()
		$mapa_star/estrellas9/tres/start3.show()

#funciones para cambiar icono de los niveles pasados
func change_icons():
	if(Gamehandler.level1 == true):
		$Level1.texture_normal = past_level
		$Level1.texture_hover = past_level
	if(Gamehandler.level2 == true):
		$Level2.texture_normal = past_level
		$Level2.texture_hover = past_level
	if(Gamehandler.level3 == true):
		$Level3.texture_normal = past_level
		$Level3.texture_hover = past_level
	if(Gamehandler.level4 == true):
		$Level4.texture_normal = past_level
		$Level4.texture_hover = past_level
	if(Gamehandler.level5 == true):
		$Level5.texture_normal = past_level
		$Level5.texture_hover = past_level
	if(Gamehandler.level6 == true):
		$Level6.texture_normal = past_level
		$Level6.texture_hover = past_level
	if(Gamehandler.level7 == true):
		$Level7.texture_normal = past_level
		$Level7.texture_hover = past_level
	if(Gamehandler.level8 == true):
		$Level8.texture_normal = past_level
		$Level8.texture_hover = past_level
	if(Gamehandler.level9 == true):
		$Level9.texture_normal = past_level
		$Level9.texture_hover = past_level


func _on_Level1_pressed():
	if(Gamehandler.vidas_jugador > 0):
		Gamehandler.enquenivelestoy = 1
		Gamehandler.update_datosdenivel()
		get_tree().get_nodes_in_group("nogame")[0].hide()
		get_tree().get_nodes_in_group("sigame")[0].show()
		new_file.show()
	else:
		get_tree().get_nodes_in_group("nogame")[0].show()
		get_tree().get_nodes_in_group("sigame")[0].hide()
		Gamehandler.enquenivelestoy = 1
		Gamehandler.update_datosdenivel()
		new_file.show()


func _on_Level2_pressed():
	if(Gamehandler.vidas_jugador < 1 || Gamehandler.level1 == false):
		get_tree().get_nodes_in_group("nogame")[0].show()
		get_tree().get_nodes_in_group("sigame")[0].hide()
		Gamehandler.enquenivelestoy = 2
		Gamehandler.update_datosdenivel()
		new_file.show()
	else:
		get_tree().get_nodes_in_group("nogame")[0].hide()
		get_tree().get_nodes_in_group("sigame")[0].show()
		Gamehandler.enquenivelestoy = 2
		Gamehandler.update_datosdenivel()
		new_file.show()


func _on_Level3_pressed():
	if(Gamehandler.vidas_jugador < 1 || Gamehandler.level2 == false):
		get_tree().get_nodes_in_group("nogame")[0].show()
		get_tree().get_nodes_in_group("sigame")[0].hide()
		Gamehandler.enquenivelestoy = 3
		Gamehandler.update_datosdenivel()
		new_file.show()
	else:
		get_tree().get_nodes_in_group("nogame")[0].hide()
		get_tree().get_nodes_in_group("sigame")[0].show()
		Gamehandler.enquenivelestoy = 3
		Gamehandler.update_datosdenivel()
		new_file.show()


func _on_Level4_pressed():
	if(Gamehandler.vidas_jugador < 1 || Gamehandler.level3 == false):
		get_tree().get_nodes_in_group("nogame")[0].show()
		get_tree().get_nodes_in_group("sigame")[0].hide()
		Gamehandler.enquenivelestoy = 4
		Gamehandler.update_datosdenivel()
		new_file.show()
	else:
		get_tree().get_nodes_in_group("nogame")[0].hide()
		get_tree().get_nodes_in_group("sigame")[0].show()
		Gamehandler.enquenivelestoy = 4
		Gamehandler.update_datosdenivel()
		new_file.show()


func _on_Level5_pressed():
	if(Gamehandler.vidas_jugador < 1 || Gamehandler.level4 == false):
		get_tree().get_nodes_in_group("nogame")[0].show()
		get_tree().get_nodes_in_group("sigame")[0].hide()
		Gamehandler.enquenivelestoy = 5
		Gamehandler.update_datosdenivel()
		new_file.show()
	else:
		get_tree().get_nodes_in_group("nogame")[0].hide()
		get_tree().get_nodes_in_group("sigame")[0].show()
		Gamehandler.enquenivelestoy = 5
		Gamehandler.update_datosdenivel()
		new_file.show()


func _on_Level6_pressed():
	if(Gamehandler.vidas_jugador < 1 || Gamehandler.level5 == false):
		get_tree().get_nodes_in_group("nogame")[0].show()
		get_tree().get_nodes_in_group("sigame")[0].hide()
		Gamehandler.enquenivelestoy = 6
		Gamehandler.update_datosdenivel()
		new_file.show()
	else:
		get_tree().get_nodes_in_group("nogame")[0].hide()
		get_tree().get_nodes_in_group("sigame")[0].show()
		Gamehandler.enquenivelestoy = 6
		Gamehandler.update_datosdenivel()
		new_file.show()


func _on_Level7_pressed():
	if(Gamehandler.vidas_jugador < 1 || Gamehandler.level6 == false):
		get_tree().get_nodes_in_group("nogame")[0].show()
		get_tree().get_nodes_in_group("sigame")[0].hide()
		Gamehandler.enquenivelestoy = 7
		Gamehandler.update_datosdenivel()
		new_file.show()
	else:
		get_tree().get_nodes_in_group("nogame")[0].hide()
		get_tree().get_nodes_in_group("sigame")[0].show()
		Gamehandler.enquenivelestoy = 7
		Gamehandler.update_datosdenivel()
		new_file.show()


func _on_Level8_pressed():
	if(Gamehandler.vidas_jugador < 1 || Gamehandler.level7 == false):
		get_tree().get_nodes_in_group("nogame")[0].show()
		get_tree().get_nodes_in_group("sigame")[0].hide()
		Gamehandler.enquenivelestoy = 8
		Gamehandler.update_datosdenivel()
		new_file.show()
	else:
		get_tree().get_nodes_in_group("nogame")[0].hide()
		get_tree().get_nodes_in_group("sigame")[0].show()
		Gamehandler.enquenivelestoy = 8
		Gamehandler.update_datosdenivel()
		new_file.show()


func _on_Level9_pressed():
	if(Gamehandler.vidas_jugador < 1 || Gamehandler.level8 == false):
		get_tree().get_nodes_in_group("nogame")[0].show()
		get_tree().get_nodes_in_group("sigame")[0].hide()
		Gamehandler.enquenivelestoy = 9
		Gamehandler.update_datosdenivel()
		new_file.show()
	else:
		get_tree().get_nodes_in_group("nogame")[0].hide()
		get_tree().get_nodes_in_group("sigame")[0].show()
		Gamehandler.enquenivelestoy = 9
		Gamehandler.update_datosdenivel()
		new_file.show()


func _on_btn_exit_button_up():
	new_file.hide()


func mostrarprimertutorial():
	if(Gamehandler.primertutorial == 0):
		$HUD/Control/MarginContainer/HBoxContainer.hide()
		$primertutorial.show()


func _on_acceptbtn_pressed():
	Gamehandler.primertutorial = 100
	Gamehandler.first_time = 100
	$primertutorial.hide()
	$HUD/Control/MarginContainer/HBoxContainer.show()
	Gamehandler.guardar_datos()
	


func _on_new_life_timeout():
	if(Gamehandler.life_recharge > 0):
		Gamehandler.life_recharge -= 1
		Gamehandler.update_timenewlife()
	else:
		Gamehandler.life_recharge = 120
		if(Gamehandler.vidas_jugador == 5):
			get_tree().get_nodes_in_group("timernewlife")[0].stop()
		return
