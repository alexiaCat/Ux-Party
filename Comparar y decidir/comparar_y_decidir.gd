extends Node

export(Resource) var bd_cyd
export(Resource) var bd_cyd2
export(Resource) var bd_cyd3
export(Texture) var color_right
export(Texture) var color_wrong

var buttons := []
var index := 0
var quiz_shuffle := []

onready var question_texts := $question_info/txt_question


#############################CARGA EL JUEGO########################################################## 
func _ready() -> void:
	for _button in $question_holder.get_children():
		buttons.append(_button)
	Gamehandler.npregunta = 1
	Gamehandler.update_npregunta()
	Gamehandler.puntos = 0
	Gamehandler.update_puntos()
	if Gamehandler.enquenivelestoy == 3:
		quiz_shuffle = randomize_array(bd_cyd.bd)
	elif Gamehandler.enquenivelestoy == 6:
		quiz_shuffle = randomize_array(bd_cyd2.bd)
	elif Gamehandler.enquenivelestoy == 9:
		quiz_shuffle = randomize_array(bd_cyd3.bd)
	load_quiz()


#####################################################################################################

func load_quiz() -> void:

		if Gamehandler.enquenivelestoy == 3:
			if index >= bd_cyd.bd.size():
				if Gamehandler.puntos <= 199:
					_perdiste_por_puntos()	
				else:
					_on_Letters_youwin_quiz_3()			
				return
				
			question_texts.text = str(quiz_shuffle[index].question_info)
			var options = randomize_array(bd_cyd.bd[index].options)
			randomize()
			options.shuffle()

			for i in buttons.size():
				buttons[i].texture_normal = options[i]
				buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])
	
#######################################################################################################	
		elif Gamehandler.enquenivelestoy == 6:
			if index >= bd_cyd2.bd.size():
				if Gamehandler.puntos <= 199:
					_perdiste_por_puntos()	
				else:
					_on_Letters_youwin_quiz_6()			
				return
				
			#randomiza el orden de las preguntas
			question_texts.text = str(quiz_shuffle[index].question_info)	
			
			#randomiza el orden de las respuestas
			var options = randomize_array(bd_cyd2.bd[index].options)
			randomize()
			options.shuffle()
	
	
			for i in buttons.size():
				buttons[i].texture_normal = options[i]
				buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])
	
######################################################################################################	
		elif Gamehandler.enquenivelestoy == 9:
			if index >= bd_cyd3.bd.size():
				if Gamehandler.puntos <= 199:
					_perdiste_por_puntos()	
				else:
					_on_Letters_youwin_quiz_9()			
								
				return

			#randomiza el orden de las preguntas
			question_texts.text = str(quiz_shuffle[index].question_info)
	
			#randomiza el orden de las respuestas
			var options = randomize_array(bd_cyd3.bd[index].options)
			randomize()
			options.shuffle()
	
	
			for i in buttons.size():
				buttons[i].texture_normal = options[i]
				buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])
####################################################################################################	
	
####################################################################################################	
#valida que la respuesta seleccionada sea correcta o incorrecta y pasa a la sgte pregunta
func buttons_answer(button) -> void:
	if Gamehandler.enquenivelestoy == 3: 
		if Gamehandler.tiempo <= 12:
			if bd_cyd.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 100
				button.texture_normal = color_right
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
			else:
				Gamehandler.puntos += 0
				button.texture_normal = color_wrong
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
		elif Gamehandler.tiempo > 12: 
			if bd_cyd.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 40
				button.texture_normal = color_right
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
			else:
				Gamehandler.puntos += 0
				button.texture_normal = color_wrong
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
		if (Gamehandler.npregunta < 5):
			Gamehandler.npregunta += 1
		Gamehandler.update_npregunta()
		Gamehandler.update_puntos()

		yield(get_tree().create_timer(1), "timeout")
		for bt in buttons:
			bt.disabled = false
			bt.modulate = Color.white
			bt.disconnect("pressed", self, "buttons_answer")
		
		index += 1
		Gamehandler.tiempo = 0
		load_quiz()
	
	if Gamehandler.enquenivelestoy == 6: 
		if Gamehandler.tiempo <= 12:
			if bd_cyd2.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 100
				button.texture_normal = color_right
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
			else:
				Gamehandler.puntos += 0
				button.texture_normal = color_wrong
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
				
		elif Gamehandler.tiempo > 12: 
			if bd_cyd2.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 40
				button.texture_normal = color_right
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
			else:
				Gamehandler.puntos += 0
				button.texture_normal = color_wrong
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
		if (Gamehandler.npregunta < 5):
			Gamehandler.npregunta += 1
		Gamehandler.update_npregunta()
		Gamehandler.update_puntos()

		yield(get_tree().create_timer(1), "timeout")
		for bt in buttons:
			bt.disabled = false
			bt.modulate = Color.white
			bt.disconnect("pressed", self, "buttons_answer")
		
		index += 1
		Gamehandler.tiempo = 0
		load_quiz()
	
	#funcion mandar puntaje total del usuario
	#funcion mostrar pantalla paso nivel o perdio
	
######################################SE MUESTRA DEL NV9########################################

	if Gamehandler.enquenivelestoy == 9: 
		if Gamehandler.tiempo <= 12:
			if bd_cyd3.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 100
				button.texture_normal = color_right
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
			else:
				Gamehandler.puntos += 0
				button.texture_normal = color_wrong
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
				
		elif Gamehandler.tiempo > 12: 
			if bd_cyd3.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 40
				button.texture_normal = color_right
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
			else:
				Gamehandler.puntos += 0
				button.texture_normal = color_wrong
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
		if (Gamehandler.npregunta < 5):
			Gamehandler.npregunta += 1
		Gamehandler.update_npregunta()
		Gamehandler.update_puntos()


		yield(get_tree().create_timer(1), "timeout")
		for bt in buttons:
			bt.disabled = false
			bt.modulate = Color.white
			bt.disconnect("pressed", self, "buttons_answer")
		
		index += 1
		Gamehandler.tiempo = 0
		load_quiz()
	
	#funcion mandar puntaje total del usuario
	#funcion mostrar pantalla paso nivel o perdio
	
#####################################################################################################


func randomize_array(array: Array) -> Array:
	randomize()
	var array_temp := array
	array_temp.shuffle()
	return array_temp

	
func _on_Timer_timeout():
	Gamehandler.tiempo += 1
	Gamehandler.update_time()
	

func _on_top_bar_minigames_seacaboeltiempo():
	Gamehandler.perder_vida()
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	#emit_signal("game_over")
	print("se te acabo el tiempo")
	
func _on_Letters_youwin_quiz_3():
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	print("ganaste")
	if(Gamehandler.puntos > Gamehandler.pnivel3):
		Gamehandler.pnivel3 = Gamehandler.puntos
		
func _on_Letters_youwin_quiz_6():
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	print("ganaste")
	if(Gamehandler.puntos > Gamehandler.pnivel6):
		Gamehandler.pnivel5 = Gamehandler.puntos		

func _on_Letters_youwin_quiz_9():
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	print("ganaste")
	if(Gamehandler.puntos > Gamehandler.pnivel9):
		Gamehandler.pnivel9 = Gamehandler.puntos		
		
		
func _perdiste_por_puntos():
	Gamehandler.perder_vida()
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	print("perdiste por puntos")

