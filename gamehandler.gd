extends Node

var vidas_jugador = 5
var time_left = 60
var puntajeglobal
var turno = true
var pnivel1 
var pnivel2 
var pnivel3 
var pnivel4 
var pnivel5
var pnivel6 
var pnivel7 
var pnivel8
var pnivel9
var puntajeahorcado = 500
var puntajequiz = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(time_left/60) + ":" + String(time_left%60)
