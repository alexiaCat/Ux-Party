extends Node

var music = false
var effects = false
var cont = 6
#variable donde guardo puntaje variable 
var puntajevariable
#saber si ingrese por primera vez
var first_time = true
#saber que nivel voy a jugar
var enquenivelestoy
#cantidad maxima de vidas, comparar con vidas jugador ya que no puede exceder las 5
var vidas_jugador = 5
#timer barra superior
var time_left = 60
# Luego de pasados 4 minutos desde la pérdida de una vida se repondrá la vida perdida 240.
var life_recharge = 240
var tiempo = 0
var puntajeglobal = 0
var npregunta = 1
var nameplayer = "ingresa tu nombre"
var msg1 = "Sabes mucho"
var msg2 = "Eres genial"
var msg3 = "Eres el mejor\n del mundo"
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
var level1 = true
var level2 = true
var level3 = true
var level4 = false
var level5 = false
var level6 = false
var level7 = false
var level8 = false
var level9 = false


func _ready():
	pass

#recarga vidas cada 4 minutos
func recargarvidas():
	if (vidas_jugador < 5):
		yield(get_tree().create_timer(240), "timeout")
		vidas_jugador += 1
	update_vidas()

	
func update_puntajeacumulado():
	get_tree().get_nodes_in_group("points_player")[0].text = String(puntajeglobal)
	
func update_nombrejugador():
	get_tree().get_nodes_in_group("name_player")[0].text = nameplayer
	
func update_vidas():
	get_tree().get_nodes_in_group("vidasjugador")[0].text = String(vidas_jugador)
	
func update_npregunta():
	get_tree().get_nodes_in_group("npregunta")[0].text = String(npregunta)	
	
func disminuir_tiempo():
	get_tree().get_nodes_in_group("tiempo_left")[0].text = String(time_left/60) + ":" + String(time_left%60)

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(time_left/60) + ":" + String(time_left%60)

func update_puntos():
	get_tree().get_nodes_in_group("puntos")[0].text = String(puntos)
	
