extends Node

#saber que nivel voy a jugar
var enquenivelestoy
#cantidad maxima de vidas, comparar con vidas jugador ya que no puede exceder las 5
var vidas_jugador = 5
var time_left = 60
# Luego de pasados 4 minutos desde la pérdida de una vida se repondrá la vida perdida 240.
var life_recharge = 20
var puntajeglobal = 100
var music = true
var sounds = true
var nameplayer = "juanita"
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
var level4 = true
var level5 = true
var level6 = true
var level7 = true
var level8 = true


func _ready():
	pass
	
func recharge_life():
	if(vidas_jugador < 5):
		print(vidas_jugador)
		relojderecargarvidas()
		
func update_puntajeacumulado():
	get_tree().get_nodes_in_group("points_player")[0].text = String(puntajeglobal)
	
func update_nombrejugador():
	get_tree().get_nodes_in_group("name_player")[0].text = nameplayer
	
func update_vidas():
	get_tree().get_nodes_in_group("vidasjugador")[0].text = String(vidas_jugador)

func relojderecargarvidas():
	get_tree().get_nodes_in_group("vida_maxima")[0].text = String(life_recharge)

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(time_left/60) + ":" + String(time_left%60)

func update_puntos():
	get_tree().get_nodes_in_group("puntos")[0].text = String(puntos)
	
#funcion va en script de la escena winner
func update_msg_ganador():
	if (puntos > 199 && puntos < 299):
		print("pinta 1 sola estrella")
		get_tree().get_nodes_in_group("youwin")[0].text = msg1
		$mapa_star/estrellas2/uno/star1.show()
	elif(Gamehandler.puntos > 299 && Gamehandler.puntos < 499):
		print("pinta 2 estrellas")
		get_tree().get_nodes_in_group("youwin")[0].text = msg2
		$mapa_star/estrellas2/uno/star1.show()
	elif(Gamehandler.puntos == 500):
		get_tree().get_nodes_in_group("youwin")[0].text = msg3
