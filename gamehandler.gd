extends Node

var counterhangedgame
#cantidad maxima de vidas, comparar con vidas jugador ya que no puede exceder las 5
var vidas_jugador = 5
var time_left = 60
# Luego de pasados 4 minutos desde la pérdida de una vida se repondrá la vida perdida.
var life_recharge = 20
var puntajeglobal = 0
var turno = true
# para probar que funcionan las estrellas
var pnivel1 = 200
var pnivel2 = 500
var pnivel3 = 390
var pnivel4 
var pnivel5
var pnivel6 
var pnivel7 
var pnivel8
var pnivel9
var puntos = 0
#puntaje inicial de los minijuegos
const puntajeahorcado = 500
const puntajequiz = 0
#variables para saber si el nivel esta pasado o no, ej: no poder ingresar a nivel 2 sin pasar nivel 1
var level1 = false
var level2 = false
var level3 = false
var level4 = false
var level5 = false
var level6 = false
var level7 = false
var level8 = false
#puntajes para tener estrellas por nivel trivia y decisiones
var onestar = 200
var twostars = 300
var threestars = 500
#puntajes para tener estrellas por nivel ahorcado
var hgonestar = 225
var hgtwostars = 390
var hgthreestars = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func recharge_life():
	if(vidas_jugador < 5):
		print(vidas_jugador)
		relojderecargarvidas()

func update_vidas():
	get_tree().get_nodes_in_group("vidasjugador")[0].text = String(vidas_jugador)

func relojderecargarvidas():
	get_tree().get_nodes_in_group("vida_maxima")[0].text = String(life_recharge)

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(time_left/60) + ":" + String(time_left%60)

func update_puntos():
	get_tree().get_nodes_in_group("puntos")[0].text = String(puntos)
