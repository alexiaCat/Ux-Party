extends CanvasLayer

signal seacaboeltiempo

func _on_Timer_timeout():
	if(Gamehandler.time_left > 0):
		Gamehandler.time_left -= 1
		Gamehandler.update_time()
	else:
		emit_signal("seacaboeltiempo")
