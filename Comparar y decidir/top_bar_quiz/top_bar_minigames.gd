extends CanvasLayer
	

func _on_Timer_timeout():
	if(Gamehandler.time_left > 0):
		Gamehandler.time_left -= 1
		Gamehandler.disminuir_tiempo()
	else:
		#aca deber ir funcion mostrar ventana se acabo el tiempo
		Gamehandler._on_top_bar_minigames_seacaboeltiempo()

