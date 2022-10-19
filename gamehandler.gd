extends Node

var counterhangedgame
#cantidad maxima de vidas, comparar con vidas jugador ya que no puede exceder las 5
var vidas_jugador = 5
var time_left = 60
# Luego de pasados 4 minutos desde la pérdida de una vida se repondrá la vida perdida 240.
var life_recharge = 20
var puntajeglobal = 100
var music = true
var sounds = true
var nameplayer = "juanita"
# para probar que funcionan las estrellas
var pnivel1 = 0
var pnivel2 = 0
var pnivel3 = 0
var pnivel4 = 0
var pnivel5 = 0
var pnivel6 = 0
var pnivel7 = 0
var pnivel8 = 0
var pnivel9 = 0
var puntos = 0

#variables para saber si el nivel esta pasado o no, ej: no poder ingresar a nivel 2 sin pasar nivel 1
var level1 = false
var level2 = false
var level3 = false
var level4 = false
var level5 = false
var level6 = false
var level7 = false
var level8 = false


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
