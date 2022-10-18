extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	Gamehandler.update_vidas()
	Gamehandler.recharge_life()
	paint_stars()

func paint_stars():
	if (Gamehandler.pnivel1 >= 200):
		print("pinta 1 sola estrella")
		$mapa_star/estrellas/uno/star1.show()
	elif(Gamehandler.pnivel1 >= 300):
		print("pinta 2 estrellas")
		$mapa_star/estrellas/uno/star1.show()
		$mapa_star/estrellas/dos/star2.show()
	elif(Gamehandler.pnivel1 >= 500):
		print("pinta 3 estrellas")
		$mapa_star/estrellas/uno/star1.show()
		$mapa_star/estrellas/dos/star2.show()
		$mapa_star/estrellas/dos/star3.show()
	else:
		print("nada")

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
