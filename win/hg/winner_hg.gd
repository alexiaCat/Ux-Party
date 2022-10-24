extends Node2D

# hay que saber en que nivel estoy y hacer una condicion en el button para que avance al nivel que sigue
func _ready():
	paint_starsyupdatemsg()

func paint_starsyupdatemsg():
	if(Gamehandler.enquenivelestoy == 1 or Gamehandler.enquenivelestoy == 4 or Gamehandler.enquenivelestoy == 7):
		if (Gamehandler.puntajevariable > 224 && Gamehandler.puntajevariable < 389):
			get_tree().get_nodes_in_group("youwin")[0].text = Gamehandler.msg1
			$stars_lvl/star1/estrella1.show()
		elif(Gamehandler.puntajevariable > 389 && Gamehandler.puntajevariable < 499):
			get_tree().get_nodes_in_group("youwin")[0].text = Gamehandler.msg2
			$stars_lvl/star1/estrella1.show()
			$stars_lvl/star2/estrella2.show()
		elif(Gamehandler.puntajevariable == 500):
			get_tree().get_nodes_in_group("youwin")[0].text = Gamehandler.msg3
			$stars_lvl/star1/estrella1.show()
			$stars_lvl/star2/estrella2.show()
			$stars_lvl/star3/estrella3.show()
	else:
		if (Gamehandler.puntajevariable > 199 && Gamehandler.puntajevariable < 299):
			get_tree().get_nodes_in_group("youwin")[0].text = Gamehandler.msg1
			$stars_lvl/star1/estrella1.show()
		elif(Gamehandler.puntajevariable > 299 && Gamehandler.puntajevariable < 499):
			get_tree().get_nodes_in_group("youwin")[0].text = Gamehandler.msg2
			$stars_lvl/star1/estrella1.show()
			$stars_lvl/star2/estrella2.show()
		elif(Gamehandler.puntajevariable == 500):
			get_tree().get_nodes_in_group("youwin")[0].text = Gamehandler.msg3
			$stars_lvl/star1/estrella1.show()
			$stars_lvl/star2/estrella2.show()
			$stars_lvl/star3/estrella3.show()


func _on_btn_nextlvl_button_up():
	get_tree().change_scene("res://main_map/Main_scene.tscn")

