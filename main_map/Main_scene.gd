extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	Gamehandler.update_vidas()
	Gamehandler.recharge_life()
	pintarestrellasmapa()
	Gamehandler.update_puntajeacumulado()
	Gamehandler.update_nombrejugador()
	
	
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


func _on_Level1_pressed():
	if(Gamehandler.vidas_jugador > 0):
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")
	else:
		print("no tienes vidas")


func _on_Level2_pressed():
	if(Gamehandler.level1 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level3_pressed():
	if(Gamehandler.level2 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level4_pressed():
	if(Gamehandler.level3 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level5_pressed():
	if(Gamehandler.level4 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level6_pressed():
	if(Gamehandler.level5 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level7_pressed():
	if(Gamehandler.level6 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level8_pressed():
	if(Gamehandler.level7 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level9_pressed():
	if(Gamehandler.level8 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_tiempo_vidas_timeout():
	if(Gamehandler.life_recharge > 0):
		Gamehandler.life_recharge -= 1
		print("life_recharge")
		Gamehandler.relojderecargarvidas()
	else:
		Gamehandler.vidas_jugador += 1
		Gamehandler.life_recharge = 240
