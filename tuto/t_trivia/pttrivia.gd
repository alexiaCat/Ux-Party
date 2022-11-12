extends Control

var cont = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_btn1_pressed():
	$triviapt/acceptbtn.hide()
	cont = 0
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(0)


func _on_btn2_pressed():
	$triviapt/acceptbtn.hide()
	cont = 1
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(1)


func _on_btn3_pressed():
	$triviapt/acceptbtn.hide()
	cont = 2
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(2)


func _on_btn4_pressed():
	$triviapt/acceptbtn.show()
	cont = 3
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(3)


func _on_izquierda_pressed():
	if (cont > 0):
		cont -= 1
		$triviapt/acceptbtn.hide()
	elif(cont == 2):
		$triviapt/acceptbtn.hide()
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(cont)


func _on_derecha_pressed():
	if (cont < 3):
		cont += 1
		if(cont == 3):
			$triviapt/acceptbtn.show()
	print(cont)
	get_tree().get_nodes_in_group("primertrivia")[0].set_frame(cont)
