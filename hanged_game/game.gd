extends Node2D
var counter
#variable para detectar a que escena debe enviar si gana o pierde
var win = false



func _ready():
	counter = 0
	Gamehandler.time_left = 60
	Gamehandler.puntos = 500
	Gamehandler.update_puntos()

func perder_vida():
	Gamehandler.vidas_jugador -= 1
	Gamehandler.guardar_partida()


func perder_puntos():
	Gamehandler.puntos -= 55
	Gamehandler.update_puntos()

func _on_Letters_notthere():
	counter = counter + 1
	perder_puntos()
	print(counter)
	match counter:
		1: $hangman/person/cabeza.show()
		2: $hangman/person/torso.show()
		3: $hangman/person/brazo_izquierdo.show()
		4: $hangman/person/brazo_derecho.show()
		5: $hangman/person/pie_izquierdo.show()
		6: $hangman/person/pie_derecho.show()
	if counter == 6:
		perder_vida()
		get_tree().get_nodes_in_group("hangedtime")[0].stop()
		win = false;
		$end_timer.start()
		get_tree().get_nodes_in_group("teclado")[0].hide()
		get_tree().get_nodes_in_group("hint")[0].disabled = true
		get_tree().get_nodes_in_group("btnquit")[0].disabled = true
		get_tree().get_nodes_in_group("btntuto")[0].disabled = true



func _on_Letters_youwin():
	$end_timer.start()
	get_tree().get_nodes_in_group("teclado")[0].hide()
	get_tree().get_nodes_in_group("hint")[0].disabled = true
	get_tree().get_nodes_in_group("btnquit")[0].disabled = true
	get_tree().get_nodes_in_group("btntuto")[0].disabled = true
	Gamehandler.puntajevariable = Gamehandler.puntos
	get_tree().get_nodes_in_group("hangedtime")[0].stop()
	win = true;
	if (Gamehandler.enquenivelestoy == 1):
		Gamehandler.level1 = true
		if(Gamehandler.puntos > Gamehandler.pnivel1):
			Gamehandler.pnivel1 = Gamehandler.puntos
			Gamehandler.puntajeglobal += Gamehandler.puntos
	elif (Gamehandler.enquenivelestoy == 4):
		Gamehandler.level4 = true
		if(Gamehandler.puntos > Gamehandler.pnivel4):
			Gamehandler.pnivel4 = Gamehandler.puntos
			Gamehandler.puntajeglobal += Gamehandler.puntos
	else:
		Gamehandler.level7 = true
		if(Gamehandler.puntos > Gamehandler.pnivel7):
			Gamehandler.pnivel7 = Gamehandler.puntos
			Gamehandler.puntajeglobal += Gamehandler.puntos
	Gamehandler.time_left = 60
	Gamehandler.guardar_partida()
		


func _on_end_timer_timeout():
	Gamehandler.guardar_partida()
	if (win == true):
		get_tree().change_scene("res://win/hg/winner_hg.tscn")
	else:
		get_tree().change_scene("res://lost/loser.tscn")


