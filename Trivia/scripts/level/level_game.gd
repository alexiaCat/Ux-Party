extends Node

export(Resource) var bd_quiz
export(Resource) var bd_quiz_2
export(Resource) var bd_quiz_3
export(Color) var color_right
export(Color) var color_wrong

var buttons := []
var index := 0
var quiz_shuffle := []
#variable para detectar a que escena debe enviar si gana o pierde
var win = false

onready var question_texts := $question_info/txt_question

#carga el juego 
func _ready() -> void:
	for _button in $question_holder.get_children():
		buttons.append(_button)
	Gamehandler.puntos = 0
	Gamehandler.npregunta = 1
	Gamehandler.update_puntos()
	if Gamehandler.enquenivelestoy == 2:
		quiz_shuffle = randomize_array(bd_quiz.bd)
	elif Gamehandler.enquenivelestoy == 5:
		quiz_shuffle = randomize_array(bd_quiz_2.bd)
	elif Gamehandler.enquenivelestoy == 8:
		quiz_shuffle = randomize_array(bd_quiz_3.bd)
	load_quiz()	
	
#FUNCION QUE CARGA LAS DISTINTAS PREGUNTAS SEGUN EL NIVEL
func load_quiz() -> void:	
#######################AQUI SE CARGAN PREGUNTAS DEL NIVEL 2#########################################
	if Gamehandler.enquenivelestoy == 2:
		if index >= bd_quiz.bd.size():
			if Gamehandler.puntos <= 199:
				_perdiste_por_puntos()	
			else:
				_on_Letters_youwin_quiz()			
			return
				
		#randomiza el orden de las preguntas
		question_texts.text = str(quiz_shuffle[index].question_info)
		
		#randomiza el orden de las respuestas
		var options = randomize_array(bd_quiz.bd[index].options)
		randomize()
		options.shuffle()
		
		for i in buttons.size():
			buttons[i].text = str(options[i])
			buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])

#######################AQUI SE CARGAN PREGUNTAS DEL NIVEL 5#########################################

	elif Gamehandler.enquenivelestoy == 5:
		if index >= bd_quiz_2.bd.size():
			if Gamehandler.puntos <= 199:
				#mostrar ventana que perdio
				_perdiste_por_puntos()	
			else:
				#asignar puntaje a puntaje global
				#mostrar ventana que gano
				_on_Letters_youwin_quiz_5()			
							
			return
				
		#randomiza el orden de las preguntas
		question_texts.text = str(quiz_shuffle[index].question_info)
		
		#randomiza el orden de las respuestas
		var options = randomize_array(bd_quiz_2.bd[index].options)
		randomize()
		options.shuffle()
		
		for i in buttons.size():
			buttons[i].text = str(options[i])
			buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])

#######################AQUI SE CARGAN PREGUNTAS DEL NIVEL 3#########################################
#######################AQUI SE CARGAN PREGUNTAS DEL NIVEL 8#########################################

	elif Gamehandler.enquenivelestoy == 8:
		if index >= bd_quiz_3.bd.size():
			if Gamehandler.puntos <= 199:
				#mostrar ventana que perdio
				_perdiste_por_puntos()	
			else:
				#asignar puntaje a puntaje global
				#mostrar ventana que gano
				_on_Letters_youwin_quiz_8()			
							
			return
				
		#randomiza el orden de las preguntas
		question_texts.text = str(quiz_shuffle[index].question_info)
		
		#randomiza el orden de las respuestas
		var options = randomize_array(bd_quiz_3.bd[index].options)
		randomize()
		options.shuffle()
		
		for i in buttons.size():
			buttons[i].text = str(options[i])
			buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])

####################################################################################################
	
#FUNCION DE LOS BOTONES  DONDE SE VALIDA AL SELECCIONAR UNA PREGUNTA
func buttons_answer(button) -> void:
#aqui se valida el tiempo y se asigna el puntaje de acuerdo al t° de respuesta
	if Gamehandler.enquenivelestoy == 2:    
		if Gamehandler.tiempo2 <= 12:
			if bd_quiz.bd[index].correct == button.text:
				Gamehandler.puntos += 100
				if (Gamehandler.npregunta < 5):
					Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				$correct.play()
				button.modulate = color_right
				get_tree().get_nodes_in_group("button")[0].disabled = true
				get_tree().get_nodes_in_group("button")[1].disabled = true
				get_tree().get_nodes_in_group("button")[2].disabled = true
				get_tree().get_nodes_in_group("button")[3].disabled = true
			else:
				Gamehandler.puntos += 0
				if (Gamehandler.npregunta < 5):
					Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				$error.play()
				button.modulate = color_wrong
				get_tree().get_nodes_in_group("button")[0].disabled = true
				get_tree().get_nodes_in_group("button")[1].disabled = true
				get_tree().get_nodes_in_group("button")[2].disabled = true
				get_tree().get_nodes_in_group("button")[3].disabled = true
				
		elif Gamehandler.tiempo2 > 12: 
			if bd_quiz.bd[index].correct == button.text:
				Gamehandler.puntos += 40
				if (Gamehandler.npregunta < 5):
					Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				$correct.play()
				button.modulate = color_right
				get_tree().get_nodes_in_group("button")[0].disabled = true
				get_tree().get_nodes_in_group("button")[1].disabled = true
				get_tree().get_nodes_in_group("button")[2].disabled = true
				get_tree().get_nodes_in_group("button")[3].disabled = true
			else:
				Gamehandler.puntos += 0
				if (Gamehandler.npregunta < 5):
					Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				$error.play()
				button.modulate = color_wrong
				get_tree().get_nodes_in_group("button")[0].disabled = true
				get_tree().get_nodes_in_group("button")[1].disabled = true
				get_tree().get_nodes_in_group("button")[2].disabled = true
				get_tree().get_nodes_in_group("button")[3].disabled = true

		yield(get_tree().create_timer(1), "timeout")
		for bt in buttons:
			bt.disabled = false
			bt.modulate = Color.white
			bt.disconnect("pressed", self, "buttons_answer")
		
		index += 1
		Gamehandler.tiempo2 = 0
		load_quiz()
	
	#funcion mandar puntaje total del usuario
	#funcion mostrar pantalla paso nivel o perdio

#######################SE VALIDA EL PUNTAJE Y SE PASA A LA SIGUIENTE PREGUNTA LVL 5#########################################
	elif Gamehandler.enquenivelestoy == 5:    
		if Gamehandler.tiempo2 <= 12:
			if bd_quiz_2.bd[index].correct == button.text:
				Gamehandler.puntos += 100
				if (Gamehandler.npregunta < 5):
					Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_right
				$correct.play()
				get_tree().get_nodes_in_group("button")[0].disabled = true
				get_tree().get_nodes_in_group("button")[1].disabled = true
				get_tree().get_nodes_in_group("button")[2].disabled = true
				get_tree().get_nodes_in_group("button")[3].disabled = true
			else:
				Gamehandler.puntos += 0
				if (Gamehandler.npregunta < 5):
					Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_wrong
				$error.play()
				get_tree().get_nodes_in_group("button")[0].disabled = true
				get_tree().get_nodes_in_group("button")[1].disabled = true
				get_tree().get_nodes_in_group("button")[2].disabled = true
				get_tree().get_nodes_in_group("button")[3].disabled = true
				
		elif Gamehandler.tiempo2 > 12: 
			if bd_quiz_2.bd[index].correct == button.text:
				Gamehandler.puntos += 40
				if (Gamehandler.npregunta < 5):
					Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_right
				$correct.play()
				get_tree().get_nodes_in_group("button")[0].disabled = true
				get_tree().get_nodes_in_group("button")[1].disabled = true
				get_tree().get_nodes_in_group("button")[2].disabled = true
				get_tree().get_nodes_in_group("button")[3].disabled = true
			else:
				Gamehandler.puntos += 0
				if (Gamehandler.npregunta < 5):
					Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_wrong
				$error.play()
				get_tree().get_nodes_in_group("button")[0].disabled = true
				get_tree().get_nodes_in_group("button")[1].disabled = true
				get_tree().get_nodes_in_group("button")[2].disabled = true
				get_tree().get_nodes_in_group("button")[3].disabled = true				 		
					

		yield(get_tree().create_timer(1), "timeout")
		for bt in buttons:
			bt.disabled = false
			bt.modulate = Color.white
			bt.disconnect("pressed", self, "buttons_answer")
		
		index += 1
		Gamehandler.tiempo2 = 0
		load_quiz()
	
	#funcion mandar puntaje total del usuario
	#funcion mostrar pantalla paso nivel o perdio
##########################################################################################################
#######################SE VALIDA EL PUNTAJE Y SE PASA A LA SIGUIENTE PREGUNTA LVL 8#########################################
	elif Gamehandler.enquenivelestoy == 8:    
		if Gamehandler.tiempo2 <= 12:
			if bd_quiz_3.bd[index].correct == button.text:
				Gamehandler.puntos += 100
				if (Gamehandler.npregunta < 5):
					Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_right
				$correct.play()
				get_tree().get_nodes_in_group("button")[0].disabled = true
				get_tree().get_nodes_in_group("button")[1].disabled = true
				get_tree().get_nodes_in_group("button")[2].disabled = true
				get_tree().get_nodes_in_group("button")[3].disabled = true
			else:
				Gamehandler.puntos += 0
				if (Gamehandler.npregunta < 5):
					Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_wrong
				$error.play()
				get_tree().get_nodes_in_group("button")[0].disabled = true
				get_tree().get_nodes_in_group("button")[1].disabled = true
				get_tree().get_nodes_in_group("button")[2].disabled = true
				get_tree().get_nodes_in_group("button")[3].disabled = true
				
		elif Gamehandler.tiempo2 > 12: 
			if bd_quiz_3.bd[index].correct == button.text:
				Gamehandler.puntos += 40
				if (Gamehandler.npregunta < 5):
					Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_right
				$correct.play()
				get_tree().get_nodes_in_group("button")[0].disabled = true
				get_tree().get_nodes_in_group("button")[1].disabled = true
				get_tree().get_nodes_in_group("button")[2].disabled = true
				get_tree().get_nodes_in_group("button")[3].disabled = true
			else:
				Gamehandler.puntos += 0
				if (Gamehandler.npregunta < 5):
					Gamehandler.npregunta += 1
				Gamehandler.update_puntos()
				Gamehandler.update_npregunta()
				button.modulate = color_wrong
				$error.play()
				get_tree().get_nodes_in_group("button")[0].disabled = true
				get_tree().get_nodes_in_group("button")[1].disabled = true
				get_tree().get_nodes_in_group("button")[2].disabled = true
				get_tree().get_nodes_in_group("button")[3].disabled = true					 		
					

		yield(get_tree().create_timer(1), "timeout")
		for bt in buttons:
			bt.disabled = false
			bt.modulate = Color.white
			bt.disconnect("pressed", self, "buttons_answer")
		
		index += 1
		Gamehandler.tiempo2 = 0
		load_quiz()
	
	#funcion mandar puntaje total del usuario
	#funcion mostrar pantalla paso nivel o perdio
###################################################################################################



func randomize_array(array: Array) -> Array:
	randomize()
	var array_temp := array
	array_temp.shuffle()
	return array_temp


func _on_Timer_timeout():
	Gamehandler.tiempo2 += 1
	Gamehandler.update_time2()
	
func perder_vida():
	Gamehandler.vidas_jugador -= 1

func _on_Letters_youwin_quiz():
	Gamehandler.puntajevariable = Gamehandler.puntos
	$finish_timer.start()
	win = true;
	Gamehandler.level2 = true
	if(Gamehandler.puntos > Gamehandler.pnivel2):
		Gamehandler.pnivel2 = Gamehandler.puntos
		Gamehandler.puntajeglobal += Gamehandler.puntos
		
func _on_Letters_youwin_quiz_5():
	Gamehandler.puntajevariable = Gamehandler.puntos
	$finish_timer.start()
	Gamehandler.level5 = true
	win = true;
	if(Gamehandler.puntos > Gamehandler.pnivel5):
		Gamehandler.pnivel5 = Gamehandler.puntos
		Gamehandler.puntajeglobal += Gamehandler.puntos		

func _on_Letters_youwin_quiz_8():
	Gamehandler.level8 = true
	Gamehandler.puntajevariable = Gamehandler.puntos
	$finish_timer.start()
	win = true;
	if(Gamehandler.puntos > Gamehandler.pnivel8):
		Gamehandler.pnivel8 = Gamehandler.puntos
		Gamehandler.puntajeglobal += Gamehandler.puntos
		
func _perdiste_por_puntos():
	win = false;
	$finish_timer.start()
	perder_vida()

func _on_finish_timer_timeout():
	if (win == true):
		get_tree().change_scene("res://win/hg/winner_hg.tscn")
	else:
		get_tree().change_scene("res://lost/loser.tscn")	
