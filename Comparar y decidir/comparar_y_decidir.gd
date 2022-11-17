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
#variable para detectar a que escena debe enviar si gana o pierde
var win = false

#############################CARGA EL JUEGO########################################################## 
func _ready() -> void:
	for _button in $question_holder.get_children():
		buttons.append(_button)
	Gamehandler.npregunta = 1
	Gamehandler.time_left = 60
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
				$question_holder.hide()
				$question_info.hide()
				get_tree().get_nodes_in_group("timercyd")[0].stop()
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
				$question_holder.hide()
				$question_info.hide()
				get_tree().get_nodes_in_group("timercyd")[0].stop()
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
				$question_holder.hide()
				$question_info.hide()
				get_tree().get_nodes_in_group("timercyd")[0].stop()
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
				$correct.play()
				button.texture_normal = color_right
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
			else:
				Gamehandler.puntos += 0
				$error.play()
				button.texture_normal = color_wrong
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
		elif Gamehandler.tiempo > 12: 
			if bd_cyd.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 40
				$correct.play()
				button.texture_normal = color_right
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
			else:
				Gamehandler.puntos += 0
				$error.play()
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
				$correct.play()
				button.texture_normal = color_right
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
			else:
				Gamehandler.puntos += 0
				$error.play()
				button.texture_normal = color_wrong
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
				
		elif Gamehandler.tiempo > 12: 
			if bd_cyd2.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 40
				$correct.play()
				button.texture_normal = color_right
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
			else:
				Gamehandler.puntos += 0
				button.texture_normal = color_wrong
				$error.play()
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
				$correct.play()
				button.texture_normal = color_right
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
			else:
				Gamehandler.puntos += 0
				$error.play()
				button.texture_normal = color_wrong
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
				
		elif Gamehandler.tiempo > 12: 
			if bd_cyd3.bd[index].correct == button.texture_normal:
				Gamehandler.puntos += 40
				$correct.play()
				button.texture_normal = color_right
				get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
				get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
			else:
				Gamehandler.puntos += 0
				$error.play()
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

func perder_vida():
	Gamehandler.vidas_jugador -= 1
	Gamehandler.guardar_partida()

	
func _on_Timer_timeout():
	Gamehandler.tiempo += 1
	Gamehandler.update_time()
	

func _on_top_bar_minigames_seacaboeltiempo():
	Gamehandler.perder_vida()
	get_tree().change_scene("res://main_map/Main_scene.tscn")
	#emit_signal("game_over")
	print("se te acabo el tiempo")
	
func _on_Letters_youwin_quiz_3():
	Gamehandler.puntajevariable = Gamehandler.puntos
	$finish_timer.start()
	win = true;
	Gamehandler.level3 = true
	if(Gamehandler.puntos > Gamehandler.pnivel3):
		Gamehandler.pnivel3 = Gamehandler.puntos
		Gamehandler.puntajeglobal += Gamehandler.puntos
		
func _on_Letters_youwin_quiz_6():
	Gamehandler.puntajevariable = Gamehandler.puntos
	$finish_timer.start()
	win = true;
	Gamehandler.level6 = true
	if(Gamehandler.puntos > Gamehandler.pnivel6):
		Gamehandler.pnivel6 = Gamehandler.puntos
		Gamehandler.puntajeglobal += Gamehandler.puntos

func _on_Letters_youwin_quiz_9():
	Gamehandler.puntajevariable = Gamehandler.puntos
	$finish_timer.start()
	win = true;
	Gamehandler.level9 = true
	if(Gamehandler.puntos > Gamehandler.pnivel9):
		Gamehandler.pnivel9 = Gamehandler.puntos
		Gamehandler.puntajeglobal += Gamehandler.puntos
		
		
func _perdiste_por_puntos():
	win = false;
	$finish_timer.start()
	perder_vida()


func _on_finish_timer_timeout():
	Gamehandler.guardar_partida()
	if (win == true):
		get_tree().change_scene("res://win/hg/winner_hg.tscn")
	else:
		get_tree().change_scene("res://lost/loser.tscn")	


func _on_tiempocyd_timeout():
	Gamehandler.tiempo += 1
	Gamehandler.update_timecyd()
