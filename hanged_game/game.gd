extends Node2D
var sounds_bus = AudioServer.get_bus_index("Efectos")
var sounds_bus2 = AudioServer.get_bus_index("Musica")
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
		win = false;
		$end_timer.start()
		print("perdiste")



func _on_Letters_youwin():
	$end_timer.start()
	Gamehandler.puntajevariable = Gamehandler.puntos
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
		


func _on_end_timer_timeout():
	if (win == true):
		get_tree().change_scene("res://win/hg/winner_hg.tscn")
	else:
		get_tree().change_scene("res://lost/loser.tscn")


func _on_music_toggled(button_pressed):
	if (button_pressed == true):
		Gamehandler.effects = button_pressed
		print(button_pressed)
		AudioServer.set_bus_volume_db(sounds_bus2, -80.0)
	else:
		print(button_pressed)
		Gamehandler.effects = button_pressed
		AudioServer.set_bus_volume_db(sounds_bus2, 0)


func _on_efects_toggled(button_pressed):
	if (button_pressed == true):
		Gamehandler.effects = button_pressed
		print(button_pressed)
		AudioServer.set_bus_volume_db(sounds_bus, -80.0)
	else:
		print(button_pressed)
		Gamehandler.effects = button_pressed
		AudioServer.set_bus_volume_db(sounds_bus, 0)
