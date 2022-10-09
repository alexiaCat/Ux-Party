extends CanvasLayer
	

func _on_Timer_timeout():
	if(Gamehandler.time_left > 0):
		Gamehandler.time_left -= 1
		Gamehandler.update_time()
	else:
		print("Se acabo el tiempo")
