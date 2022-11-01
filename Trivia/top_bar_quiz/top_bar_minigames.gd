extends CanvasLayer
	

func _on_Timer_timeout():
	if(Gamehandler.time_left > 0):
		Gamehandler.time_left -= 1
		Gamehandler.disminuir_tiempo()
	else:
		if(Gamehandler.puntos > 199):
			Gamehandler.puntajevariable = Gamehandler.puntos
			if(Gamehandler.enquenivelestoy == 2):
				Gamehandler.level2 = true
				if(Gamehandler.puntos > Gamehandler.pnivel2):
					Gamehandler.pnivel2 = Gamehandler.puntos
					Gamehandler.puntajeglobal += Gamehandler.puntos
			elif(Gamehandler.enquenivelestoy == 5):
				Gamehandler.level5 = true
				if(Gamehandler.puntos > Gamehandler.pnivel5):
					Gamehandler.pnivel5 = Gamehandler.puntos
					Gamehandler.puntajeglobal += Gamehandler.puntos
			else:
				Gamehandler.level8 = true
				if(Gamehandler.puntos > Gamehandler.pnivel8):
					Gamehandler.pnivel8 = Gamehandler.puntos
					Gamehandler.puntajeglobal += Gamehandler.puntos
			get_tree().change_scene("res://win/hg/winner_hg.tscn")
		else:
			Gamehandler.vidas_jugador -= 1
			get_tree().change_scene("res://lost/loser.tscn")
