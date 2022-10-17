extends Node2D


var counter

# Called when the node enters the scene tree for the first time.
func _ready():
	counter = 0
	Gamehandler.puntos = 500
	Gamehandler.update_puntos()


func perder_vida():
	Gamehandler.vidas_jugador -= 1

func perder_puntos():
	Gamehandler.puntos -= 55
	Gamehandler.update_puntos()

func _on_Letters_notthere():
	counter = counter + 1
	perder_puntos()
	print(counter)
	match counter:
		1: $hangman/person/cabeza.show()
		2: $hangman/person/torso.show()
		3: $hangman/person/brazo_izquierdo.show()
		4: $hangman/person/brazo_derecho.show()
		5: $hangman/person/pie_izquierdo.show()
		6: $hangman/person/pie_derecho.show()
	if counter == 6:
		perder_vida()
		#probar si funciona contador de vidas
		get_tree().change_scene("res://main_map/Main_scene.tscn")
		print("perdiste")

