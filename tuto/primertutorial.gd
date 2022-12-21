extends Control
export(Texture) var iconnormal
export(Texture) var icongr

var cont = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func cambiarIcons():
	if cont == 0:
		$first_tuto/HBoxContainer/btn1.texture_normal = icongr
		$first_tuto/HBoxContainer/btn2.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn3.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn4.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn5.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn6.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn7.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn8.texture_normal = iconnormal
	elif cont == 1:
		$first_tuto/HBoxContainer/btn1.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn2.texture_normal = icongr
		$first_tuto/HBoxContainer/btn3.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn4.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn5.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn6.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn7.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn8.texture_normal = iconnormal
	elif cont == 2:
		$first_tuto/HBoxContainer/btn1.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn2.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn3.texture_normal = icongr
		$first_tuto/HBoxContainer/btn4.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn5.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn6.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn7.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn8.texture_normal = iconnormal
	elif cont == 3:
		$first_tuto/HBoxContainer/btn1.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn2.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn3.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn4.texture_normal = icongr
		$first_tuto/HBoxContainer/btn5.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn6.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn7.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn8.texture_normal = iconnormal
	elif cont == 4:
		$first_tuto/HBoxContainer/btn1.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn2.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn3.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn4.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn5.texture_normal = icongr
		$first_tuto/HBoxContainer/btn6.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn7.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn8.texture_normal = iconnormal
	elif cont == 5:
		$first_tuto/HBoxContainer/btn1.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn2.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn3.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn4.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn5.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn6.texture_normal = icongr
		$first_tuto/HBoxContainer/btn7.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn8.texture_normal = iconnormal
	elif cont == 6:
		$first_tuto/HBoxContainer/btn1.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn2.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn3.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn4.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn5.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn6.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn7.texture_normal = icongr
		$first_tuto/HBoxContainer/btn8.texture_normal = iconnormal
	elif cont == 7:
		$first_tuto/HBoxContainer/btn1.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn2.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn3.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn4.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn5.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn6.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn7.texture_normal = iconnormal
		$first_tuto/HBoxContainer/btn8.texture_normal = icongr

func _on_btn1_pressed():
	$first_tuto/acceptbtn.hide()
	$first_tuto/Cl.hide()
	cont = 0
	cambiarIcons()
	get_tree().get_nodes_in_group("primert")[0].set_frame(0)


func _on_btn2_pressed():
	$first_tuto/acceptbtn.hide()
	$first_tuto/Cl.hide()
	cont = 1
	cambiarIcons()
	get_tree().get_nodes_in_group("primert")[0].set_frame(1)


func _on_btn3_pressed():
	$first_tuto/acceptbtn.hide()
	$first_tuto/Cl.hide()
	cont = 2
	cambiarIcons()
	get_tree().get_nodes_in_group("primert")[0].set_frame(2)


func _on_btn4_pressed():
	$first_tuto/acceptbtn.hide()
	$first_tuto/Cl.hide()
	cont = 3
	cambiarIcons()
	get_tree().get_nodes_in_group("primert")[0].set_frame(3)


func _on_izquierda_pressed():
	if (cont > 0):
		cont -= 1
		cambiarIcons()
		$first_tuto/acceptbtn.hide()
		$first_tuto/Cl.hide()
	elif(cont == 2):
		cambiarIcons()
		$first_tuto/acceptbtn.hide()
		$first_tuto/Cl.hide()
	get_tree().get_nodes_in_group("primert")[0].set_frame(cont)

func _on_derecha_pressed():
	if (cont < 7):
		cont += 1
		cambiarIcons()
		if(cont == 7):
			cambiarIcons()
			$first_tuto/acceptbtn.show()
			$first_tuto/Cl.show()
	get_tree().get_nodes_in_group("primert")[0].set_frame(cont)


func _on_btn5_pressed():
	$first_tuto/acceptbtn.hide()
	$first_tuto/Cl.hide()
	cont = 4
	cambiarIcons()
	get_tree().get_nodes_in_group("primert")[0].set_frame(4)


func _on_btn6_pressed():
	$first_tuto/acceptbtn.hide()
	$first_tuto/Cl.hide()
	cont = 5
	cambiarIcons()
	get_tree().get_nodes_in_group("primert")[0].set_frame(5)


func _on_btn7_pressed():
	$first_tuto/acceptbtn.hide()
	$first_tuto/Cl.hide()
	cont = 6
	cambiarIcons()
	get_tree().get_nodes_in_group("primert")[0].set_frame(6)


func _on_btn8_pressed():
	$first_tuto/acceptbtn.show()
	$first_tuto/Cl.show()
	cont = 7
	cambiarIcons()
	get_tree().get_nodes_in_group("primert")[0].set_frame(7)
