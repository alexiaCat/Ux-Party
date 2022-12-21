extends Control
export(Texture) var iconnormal
export(Texture) var icongr

var cont = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func cambiarIcons():
	if cont == 0:
		$triviapt/HBoxContainer/btn1.texture_normal = icongr
		$triviapt/HBoxContainer/btn2.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn3.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn4.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn5.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn6.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 1:
		$triviapt/HBoxContainer/btn1.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn2.texture_normal = icongr
		$triviapt/HBoxContainer/btn3.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn4.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn5.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn6.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 2:
		$triviapt/HBoxContainer/btn1.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn2.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn3.texture_normal = icongr
		$triviapt/HBoxContainer/btn4.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn5.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn6.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 3:
		$triviapt/HBoxContainer/btn1.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn2.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn3.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn4.texture_normal = icongr
		$triviapt/HBoxContainer/btn5.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn6.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 4:
		$triviapt/HBoxContainer/btn1.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn2.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn3.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn4.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn5.texture_normal = icongr
		$triviapt/HBoxContainer/btn6.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 5:
		$triviapt/HBoxContainer/btn1.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn2.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn3.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn4.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn5.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn6.texture_normal = icongr
		$triviapt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 6:
		$triviapt/HBoxContainer/btn1.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn2.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn3.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn4.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn5.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn6.texture_normal = iconnormal
		$triviapt/HBoxContainer/btn7.texture_normal = icongr


func _on_btn1_pressed():
	$triviapt/acceptbtn.hide()
	$triviapt/Cl.hide()
	cont = 0
	cambiarIcons()
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(0)


func _on_btn2_pressed():
	$triviapt/acceptbtn.hide()
	$triviapt/Cl.hide()
	cont = 1
	cambiarIcons()
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(1)


func _on_btn3_pressed():
	$triviapt/acceptbtn.hide()
	$triviapt/Cl.hide()
	cont = 2
	cambiarIcons()
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(2)


func _on_btn4_pressed():
	$triviapt/acceptbtn.hide()
	$triviapt/Cl.hide()
	cont = 3
	cambiarIcons()
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(3)


func _on_izquierda_pressed():
	if (cont > 0):
		cont -= 1
		cambiarIcons()
		$triviapt/acceptbtn.hide()
		$triviapt/Cl.hide()
	elif(cont == 2):
		cambiarIcons()
		$triviapt/acceptbtn.hide()
		$triviapt/Cl.hide()
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(cont)


func _on_derecha_pressed():
	if (cont < 6):
		cont += 1
		cambiarIcons()
		if(cont == 6):
			cambiarIcons()
			$triviapt/acceptbtn.show()
			$triviapt/Cl.show()
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(cont)


func _on_btn5_pressed():
	$triviapt/Cl.hide()
	$triviapt/acceptbtn.hide()
	cont = 4
	cambiarIcons()
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(4)


func _on_btn6_pressed():
	$triviapt/Cl.hide()
	$triviapt/acceptbtn.hide()
	cont = 5
	cambiarIcons()
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(5)


func _on_btn7_pressed():
	$triviapt/Cl.show()
	$triviapt/acceptbtn.show()
	cont = 6
	cambiarIcons()
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(6)


func _on_acceptbtn_pressed():
	Gamehandler.primertutorialtv = 100
	Gamehandler.guardar_datos()
	get_tree().change_scene("res://Trivia/trivia_lvl.tscn")
