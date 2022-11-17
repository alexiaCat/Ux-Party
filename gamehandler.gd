extends Node

var cont = 6
#variable donde guardo puntaje variable 
var puntajevariable
#saber si ingrese por primera vez
var first_time = 0
var primertutorial = 0
var primertutorialhg = 0
var primertutorialtv = 0
var primertutorialcyd = 0
#saber que nivel voy a jugar
var enquenivelestoy
#cantidad maxima de vidas, comparar con vidas jugador ya que no puede exceder las 5
var vidas_jugador = 5
#timer barra superior
var time_left = 60
# Luego de pasados 4 minutos desde la pérdida de una vida se repondrá la vida perdida 120 segundos.
var life_recharge = 120
var tiempo = 0
var tiempo2 = 0
var puntajeglobal = 0
var npregunta = 1
var nameplayer = "nombre"
var msg1 = "¡Eres una miniestrella!"
var msg2 = "¡Eres una estrella!"
var msg3 = "¡Eres una superestrella!"
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
const ahorcado = "Ahorcado"
const trivia = "Trivia de preguntas"
const cyd = "Juego de comparar y decidir"

#variables sonidos
var music = 0
var effects = 0
var masterxd = 0


#variables para saber si el nivel esta pasado o no, ej: no poder ingresar a nivel 2 sin pasar nivel 1
var level1 = false
var level2 = false
var level3 = false
var level4 = false
var level5 = false
var level6 = false
var level7 = false
var level8 = false
var level9 = false


var datos_partida = {
	puntos = 0,
	vidas = 0,
	nombrej = "name",
	nivel1 = false,
	p1 = 0,
	nivel2 = false,
	p2 = 0,
	nivel3 = false,
	p3 = 0,
	nivel4 = false,
	p4 = 0,
	nivel5 = false,
	p5 = 0,
	nivel6 = false,
	p6 = 0,
	nivel7 = false,
	p7 = 0,
	nivel8 = false,
	p8 = 0,
	nivel9 = false,
	p9 = 0,
	}

var otrosdatos = {
	primeravez = 0,
	primertuto = 0,
	primetutohg = 0,
	primertutotriv = 0,
	primertutocyd = 0,
}

var volumen = {
	main = 0,
	musica = 0,
	efectos = 0,
}

func _ready():
	var path = Directory.new()
	#guardar partida
	if(!path.dir_exists("user://save_data")):
		path.open("user://")
		path.make_dir("user://save_data")
	#guardar datos
	if(!path.dir_exists("user://data")):
		path.open("user://")
		path.make_dir("user://data")
	#guardar volumen
	if(!path.dir_exists("user://dataVol")):
		path.open("user://")
		path.make_dir("user://dataVol")
		
func guardar_volumen():
	var guardarv = File.new()
	guardarv.open("user://dataVol.sav", File.WRITE)
	
	var datos_vol = volumen
	datos_vol.main = masterxd
	datos_vol.musica = music
	datos_vol.efectos = effects
	
	guardarv.store_line(to_json(datos_vol))
	guardarv.close()
	
func cargar_volumen():
	var cargarv = File.new()
	if(!cargarv.file_exists("user://dataVol.sav")):
		print("no hay partidas guardadas")
		return
	cargarv.open("user://dataVol.sav", File.READ)
	
	var datosvolumen = volumen
	
	if(!cargarv.eof_reached()):
		var dato_provis = parse_json(cargarv.get_line())
		if(dato_provis != null):
			datosvolumen = dato_provis
			
	cargarv.close()
	
	masterxd = datosvolumen.main
	music = datosvolumen.musica
	effects = datosvolumen.efectos


func guardar_datos():
	var guardar = File.new()
	guardar.open("user://data.sav", File.WRITE)
	
	var datos_guardar = otrosdatos
	datos_guardar.primeravez = first_time
	datos_guardar.primertuto = primertutorial
	datos_guardar.primetutohg = primertutorialhg
	datos_guardar.primertutotriv = primertutorialtv
	datos_guardar.primertutocyd = primertutorialcyd

	guardar.store_line(to_json(datos_guardar))
	guardar.close()

func cargar_datos():
	var cargard = File.new()
	if(!cargard.file_exists("user://data.sav")):
		print("No hay partidas guardadas")
		return
	
	cargard.open("user://data.sav", File.READ)
	
	var datos_cargar = otrosdatos
	
	if(!cargard.eof_reached()):
		var dato_provis = parse_json(cargard.get_line())
		if(dato_provis != null):
			datos_cargar = dato_provis
			
	cargard.close()
	
	first_time = datos_cargar.primeravez
	primertutorial = datos_cargar.primertuto
	primertutorialhg = datos_cargar.primetutohg
	primertutorialtv = datos_cargar.primertutotriv
	primertutorialcyd = datos_cargar.primertutocyd

func guardar_partida():
	var save = File.new()
	save.open("user://save_data.sav", File.WRITE)
	
	var datos_guardar = datos_partida
	datos_guardar.puntos = puntajeglobal
	datos_guardar.vidas = vidas_jugador
	datos_guardar.nombrej = nameplayer
	datos_guardar.nivel1 = level1
	datos_guardar.nivel2 = level2
	datos_guardar.nivel3 = level3
	datos_guardar.nivel4 = level4
	datos_guardar.nivel5 = level5
	datos_guardar.nivel6 = level6
	datos_guardar.nivel7 = level7
	datos_guardar.nivel8 = level8
	datos_guardar.nivel9 = level9
	datos_guardar.p1 = pnivel1
	datos_guardar.p2 = pnivel2
	datos_guardar.p3 = pnivel3
	datos_guardar.p4 = pnivel4
	datos_guardar.p5 = pnivel5
	datos_guardar.p6 = pnivel6
	datos_guardar.p7 = pnivel7
	datos_guardar.p8 = pnivel8
	datos_guardar.p9 = pnivel9

	save.store_line(to_json(datos_guardar))
	save.close()

func cargar_partida():
	var cargar = File.new()
	if(!cargar.file_exists("user://save_data.sav")):
		print("No hay partidas guardadas")
		return
	
	cargar.open("user://save_data.sav", File.READ)
	
	var datos_cargar = datos_partida
	
	if(!cargar.eof_reached()):
		var dato_provis = parse_json(cargar.get_line())
		if(dato_provis != null):
			datos_cargar = dato_provis
			
	cargar.close()
			
	puntajeglobal = datos_cargar.puntos
	vidas_jugador = datos_cargar.vidas
	nameplayer = datos_cargar.nombrej
	pnivel1 = datos_cargar.p1
	pnivel2 = datos_cargar.p2
	pnivel3 = datos_cargar.p3
	pnivel4 = datos_cargar.p4
	pnivel5 = datos_cargar.p5
	pnivel6 = datos_cargar.p6
	pnivel7 = datos_cargar.p7
	pnivel8 = datos_cargar.p8
	pnivel9 = datos_cargar.p9

	update_nombrejugador()
	update_vidas()
	update_puntajeacumulado()



#recarga vidas cada 2 minutos
func recargarvidas():
	yield(get_tree().create_timer(120),"timeout")
	vidas_jugador = vidas_jugador + 1
	guardar_partida()
	update_vidas()
	print(vidas_jugador)
	return
	

	
func update_puntajeacumulado():
	get_tree().get_nodes_in_group("points_player")[0].text = String(puntajeglobal)
	
func update_nombrejugador():
	get_tree().get_nodes_in_group("name_player")[0].text = String(nameplayer)
	
func update_vidas():
	get_tree().get_nodes_in_group("vidasjugador")[0].text = String(vidas_jugador)
	
func update_npregunta():
	get_tree().get_nodes_in_group("npregunta")[0].text = String(npregunta)	
	
func disminuir_tiempo():
	get_tree().get_nodes_in_group("tiempo_left")[0].text = String(time_left/60) + ":" + String(time_left%60)

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(time_left/60) + ":" + String(time_left%60)
	
func update_time2():
	get_tree().get_nodes_in_group("tiempo2")[0].text = String(time_left/60) + ":" + String(time_left%60)

func update_timecyd():
	get_tree().get_nodes_in_group("time")[0].text = String(tiempo)

func update_timenewlife():
	get_tree().get_nodes_in_group("new_life")[0].text = String(life_recharge/60) + ":" + String(life_recharge%60)


func update_puntos():
	get_tree().get_nodes_in_group("puntos")[0].text = String(puntos)
	
func update_datosdenivel():
	if(enquenivelestoy == 1 || enquenivelestoy == 4 || enquenivelestoy == 7):
		get_tree().get_nodes_in_group("msgnivel")[0].text = String(ahorcado)
	elif(enquenivelestoy == 2 || enquenivelestoy == 5 || enquenivelestoy == 8):
		get_tree().get_nodes_in_group("msgnivel")[0].text = String(trivia)
	else:
		get_tree().get_nodes_in_group("msgnivel")[0].text = String(cyd)
	get_tree().get_nodes_in_group("numnivel")[0].text = String(enquenivelestoy)

