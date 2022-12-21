extends Control
export(Texture) var iconnormal
export(Texture) var icongr

var cont = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func cambiarIcons():
	if cont == 0:
		$ahorcadopt/HBoxContainer/btn1.texture_normal = icongr
		$ahorcadopt/HBoxContainer/btn2.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn3.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn4.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn5.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn6.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 1:
		$ahorcadopt/HBoxContainer/btn1.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn2.texture_normal = icongr
		$ahorcadopt/HBoxContainer/btn3.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn4.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn5.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn6.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 2:
		$ahorcadopt/HBoxContainer/btn1.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn2.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn3.texture_normal = icongr
		$ahorcadopt/HBoxContainer/btn4.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn5.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn6.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 3:
		$ahorcadopt/HBoxContainer/btn1.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn2.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn3.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn4.texture_normal = icongr
		$ahorcadopt/HBoxContainer/btn5.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn6.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 4:
		$ahorcadopt/HBoxContainer/btn1.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn2.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn3.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn4.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn5.texture_normal = icongr
		$ahorcadopt/HBoxContainer/btn6.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 5:
		$ahorcadopt/HBoxContainer/btn1.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn2.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn3.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn4.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn5.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn6.texture_normal = icongr
		$ahorcadopt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 6:
		$ahorcadopt/HBoxContainer/btn1.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn2.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn3.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn4.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn5.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn6.texture_normal = iconnormal
		$ahorcadopt/HBoxContainer/btn7.texture_normal = icongr


func _on_btn1_pressed():
	$ahorcadopt/acceptbtn.hide()
	$ahorcadopt/ColorRect.hide()
	cont = 0
	cambiarIcons()
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(0)


func _on_btn2_pressed():
	$ahorcadopt/acceptbtn.hide()
	$ahorcadopt/ColorRect.hide()
	cont = 1
	cambiarIcons()
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(1)


func _on_btn3_pressed():
	$ahorcadopt/acceptbtn.hide()
	$ahorcadopt/ColorRect.hide()
	cont = 2
	cambiarIcons()
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(2)


func _on_btn4_pressed():
	$ahorcadopt/acceptbtn.hide()
	$ahorcadopt/ColorRect.hide()
	cont = 3
	cambiarIcons()
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(3)


func _on_izquierda_pressed():
	if (cont > 0):
		cont -= 1
		cambiarIcons()
		$ahorcadopt/acceptbtn.hide()
		$ahorcadopt/ColorRect.hide()
	elif(cont == 2):
		cambiarIcons()
		$ahorcadopt/acceptbtn.hide()
		$ahorcadopt/ColorRect.hide()
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(cont)


func _on_derecha_pressed():
	if (cont < 6):
		cont += 1
		cambiarIcons()
		if(cont == 6):
			cambiarIcons()
			$ahorcadopt/acceptbtn.show()
			$ahorcadopt/ColorRect.show()
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(cont)


func _on_btn5_pressed():
	$ahorcadopt/acceptbtn.hide()
	$ahorcadopt/ColorRect.hide()
	cont = 4
	cambiarIcons()
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(4)


func _on_btn6_pressed():
	$ahorcadopt/acceptbtn.hide()
	$ahorcadopt/ColorRect.hide()
	cont = 5
	cambiarIcons()
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(5)


func _on_btn7_pressed():
	$ahorcadopt/acceptbtn.show()
	$ahorcadopt/ColorRect.show()
	cont = 6
	cambiarIcons()
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(6)



func _on_acceptbtn_pressed():
	Gamehandler.primertutorialhg = 100
	Gamehandler.guardar_datos()
	get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")
