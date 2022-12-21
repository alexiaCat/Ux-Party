extends Control
export(Texture) var iconnormal
export(Texture) var icongr

var cont = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func cambiarIcons():
	if cont == 0:
		$cydpt/HBoxContainer/btn1.texture_normal = icongr
		$cydpt/HBoxContainer/btn2.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn3.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn4.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn5.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn6.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 1:
		$cydpt/HBoxContainer/btn1.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn2.texture_normal = icongr
		$cydpt/HBoxContainer/btn3.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn4.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn5.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn6.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 2:
		$cydpt/HBoxContainer/btn1.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn2.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn3.texture_normal = icongr
		$cydpt/HBoxContainer/btn4.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn5.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn6.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 3:
		$cydpt/HBoxContainer/btn1.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn2.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn3.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn4.texture_normal = icongr
		$cydpt/HBoxContainer/btn5.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn6.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 4:
		$cydpt/HBoxContainer/btn1.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn2.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn3.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn4.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn5.texture_normal = icongr
		$cydpt/HBoxContainer/btn6.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 5:
		$cydpt/HBoxContainer/btn1.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn2.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn3.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn4.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn5.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn6.texture_normal = icongr
		$cydpt/HBoxContainer/btn7.texture_normal = iconnormal
	elif cont == 6:
		$cydpt/HBoxContainer/btn1.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn2.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn3.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn4.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn5.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn6.texture_normal = iconnormal
		$cydpt/HBoxContainer/btn7.texture_normal = icongr


func _on_btn1_pressed():
	$cydpt/acceptbtn.hide()
	$cydpt/Cl.hide()
	cont = 0
	cambiarIcons()
	get_tree().get_nodes_in_group("cydprimero")[0].set_frame(0)


func _on_btn2_pressed():
	$cydpt/acceptbtn.hide()
	$cydpt/Cl.hide()
	cont = 1
	cambiarIcons()
	get_tree().get_nodes_in_group("cydprimero")[0].set_frame(1)


func _on_btn3_pressed():
	$cydpt/acceptbtn.hide()
	$cydpt/Cl.hide()
	cont = 2
	cambiarIcons()
	get_tree().get_nodes_in_group("cydprimero")[0].set_frame(2)


func _on_btn4_pressed():
	$cydpt/acceptbtn.hide()
	$cydpt/Cl.hide()
	cont = 3
	cambiarIcons()
	get_tree().get_nodes_in_group("cydprimero")[0].set_frame(3)


func _on_izquierda_pressed():
	if (cont > 0):
		cont -= 1
		cambiarIcons()
		$cydpt/acceptbtn.hide()
		$cydpt/Cl.hide()
	elif(cont == 2):
		cambiarIcons()
		$cydpt/acceptbtn.hide()
		$cydpt/Cl.hide()
	get_tree().get_nodes_in_group("cydprimero")[0].set_frame(cont)


func _on_derecha_pressed():
	if (cont < 6):
		cont += 1
		cambiarIcons()
		if(cont == 6):
			cambiarIcons()
			$cydpt/acceptbtn.show()
			$cydpt/Cl.show()
	print(cont)
	get_tree().get_nodes_in_group("cydprimero")[0].set_frame(cont)


func _on_btn5_pressed():
	$cydpt/acceptbtn.hide()
	$cydpt/Cl.hide()
	cont = 4
	cambiarIcons()
	get_tree().get_nodes_in_group("cydprimero")[0].set_frame(4)


func _on_btn6_pressed():
	$cydpt/acceptbtn.hide()
	$cydpt/Cl.hide()
	cont = 5
	cambiarIcons()
	get_tree().get_nodes_in_group("cydprimero")[0].set_frame(5)


func _on_btn7_pressed():
	$cydpt/acceptbtn.show()
	$cydpt/Cl.show()
	cont = 6
	cambiarIcons()
	get_tree().get_nodes_in_group("cydprimero")[0].set_frame(6)



func _on_acceptbtn_pressed():
	Gamehandler.primertutorialcyd = 100
	Gamehandler.guardar_datos()
	get_tree().change_scene("res://Comparar y decidir/comparar_y_decidir.tscn")
