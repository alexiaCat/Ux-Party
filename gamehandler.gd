extends Node

var vidas_jugador = 5
var time_left = 60
var puntos = 0
var turno = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(time_left/60) + ":" + String(time_left%60)
