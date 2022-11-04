extends CanvasLayer
	

func _on_Timer_timeout():
	if(Gamehandler.time_left > 0):
		Gamehandler.time_left -= 1
		Gamehandler.disminuir_tiempo()
	else:
		if(Gamehandler.puntos > 199):
			Gamehandler.puntajevariable = Gamehandler.puntos
			if(Gamehandler.enquenivelestoy == 3):
				Gamehandler.level3 = true
				if(Gamehandler.puntos > Gamehandler.pnivel3):
					Gamehandler.pnivel3 = Gamehandler.puntos
					Gamehandler.puntajeglobal += Gamehandler.puntos
			elif(Gamehandler.enquenivelestoy == 6):
				Gamehandler.level6 = true
				if(Gamehandler.puntos > Gamehandler.pnivel6):
					Gamehandler.pnivel6 = Gamehandler.puntos
					Gamehandler.puntajeglobal += Gamehandler.puntos
			else:
				Gamehandler.level9 = true
				if(Gamehandler.puntos > Gamehandler.pnivel9):
					Gamehandler.pnivel9 = Gamehandler.puntos
					Gamehandler.puntajeglobal += Gamehandler.puntos
			get_tree().change_scene("res://win/hg/winner_hg.tscn")
		else:
			Gamehandler.vidas_jugador -= 1
			get_tree().change_scene("res://lost/loser.tscn")
