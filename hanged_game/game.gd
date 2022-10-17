extends Node2D


var counter

# Called when the node enters the scene tree for the first time.
func _ready():
	counter = 0




func _on_Letters_notthere():
	counter = counter + 1
	print(counter)
	match counter:
		1: $hangman/person/cabeza.show()
		2: $hangman/person/torso.show()
		3: $hangman/person/brazo_izquierdo.show()
		4: $hangman/person/brazo_derecho.show()
		5: $hangman/person/pie_izquierdo.show()
		6: $hangman/person/pie_derecho.show()
	if counter == 6:
		print("perdiste")
