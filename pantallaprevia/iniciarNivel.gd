extends Control


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_iniciar_pressed():
	if(Gamehandler.enquenivelestoy == 1 || Gamehandler.enquenivelestoy == 4 || Gamehandler.enquenivelestoy == 7):
		if(Gamehandler.primertutorialhg == 0):
			get_tree().change_scene("res://tuto/t_ahorcado/ptahorcado.tscn")
		else:
			get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")
	elif(Gamehandler.enquenivelestoy == 2 || Gamehandler.enquenivelestoy == 5 || Gamehandler.enquenivelestoy == 8):
		if(Gamehandler.primertutorialtv == 0):
			get_tree().change_scene("res://tuto/t_trivia/pttrivia.tscn")
		else:
			get_tree().change_scene("res://Trivia/trivia_lvl.tscn")
	else:
		if(Gamehandler.primertutorialcyd == 0):
			get_tree().change_scene("res://tuto/t_cyd/ptcyd.tscn")
		else:
			get_tree().change_scene("res://Comparar y decidir/comparar_y_decidir.tscn")
