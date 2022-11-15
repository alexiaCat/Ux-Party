extends Control


var cont = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn1_pressed():
	$ahorcadopt/acceptbtn.hide()
	$ahorcadopt/ColorRect.hide()
	cont = 0
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(0)


func _on_btn2_pressed():
	$ahorcadopt/acceptbtn.hide()
	$ahorcadopt/ColorRect.hide()
	cont = 1
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(1)


func _on_btn3_pressed():
	$ahorcadopt/acceptbtn.hide()
	$ahorcadopt/ColorRect.hide()
	cont = 2
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(2)


func _on_btn4_pressed():
	$ahorcadopt/acceptbtn.hide()
	$ahorcadopt/ColorRect.hide()
	cont = 3
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(3)


func _on_izquierda_pressed():
	if (cont > 0):
		cont -= 1
		$ahorcadopt/acceptbtn.hide()
		$ahorcadopt/ColorRect.hide()
	elif(cont == 2):
		$ahorcadopt/acceptbtn.hide()
		$ahorcadopt/ColorRect.hide()
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(cont)


func _on_derecha_pressed():
	if (cont < 6):
		cont += 1
		if(cont == 6):
			$ahorcadopt/acceptbtn.show()
			$ahorcadopt/ColorRect.show()
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(cont)


func _on_btn5_pressed():
	$ahorcadopt/acceptbtn.hide()
	$ahorcadopt/ColorRect.hide()
	cont = 4
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(4)


func _on_btn6_pressed():
	$ahorcadopt/acceptbtn.hide()
	$ahorcadopt/ColorRect.hide()
	cont = 5
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(5)


func _on_btn7_pressed():
	$ahorcadopt/acceptbtn.show()
	$ahorcadopt/ColorRect.show()
	cont = 6
	get_tree().get_nodes_in_group("primerahorcado")[0].set_frame(6)

