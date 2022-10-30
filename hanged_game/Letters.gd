extends Node2D

export (String) var input
var line = preload("res://hanged_game/Letters.tscn")


var arr_labels = []
var alpha = []
var arr_spaces = []
var wordslvl1 = ["USUARIO", "SERVICIO", "PRODUCTO", "SISTEMA"]
var hintslvl1 =["Es aquella persona que utiliza un producto o servicio de forma habitual", "2", "3","4"]
var wordslvl4 = ["PERRO", "GATO"]
var wordslvl7 = ["ALGO", "USUARIO"]
var definicion

var length
var temp

signal notthere
signal youwin



func _ready():
	if (Gamehandler.enquenivelestoy == 1):
		randomize()
		input = wordslvl1[randi() % wordslvl1.size()]
	elif (Gamehandler.enquenivelestoy == 4):
		randomize()
		input = wordslvl4[randi() % wordslvl4.size()]
	else:
		randomize()
		input = wordslvl7[randi() % wordslvl7.size()]
	temp = input
	definicion = capturardefinicion(temp)
	get_tree().get_nodes_in_group("texthint")[0].text = definicion 
	arr_labels.clear()
	alpha.clear()
	arr_spaces.clear()
	
	temp = temp.replace(" ", "/")
	
	initialize()
		
	temp = temp.replace("/", "")
	length = temp.length()

func capturardefinicion(temp):
	var def = ""
	if(temp == "USUARIO"):
		def = "Es aquel que utiliza un producto o servicio de forma habitual"
	if(temp == "SERVICIO"):
		def = "Es una utilidad intangible, que se ofrece a otra persona."
	if(temp == "PRODUCTO"):
		def = "Es algo que puedes percibir con tus sentidos: lo ves, lo tocas, lo hueles y, en algunos casos, hasta lo oyes o lo degustas"
	if(temp == "SISTEMA"):
		def = "es un sistema"
	return def

func initialize():
	var pos = $start.position
	var counter = 0
	
	for i in temp:
		var space = line.instance()
		arr_spaces.append(space)
		space.position = pos
		space.translate(Vector2(35 * counter, 0))
		var lab = space.get_node("letter")
		if i != "/":
			arr_labels.append(lab)
		elif i == "/":
			var temp_line = space.get_node("line")
			temp_line.hide()
			
		add_child(space)
		counter = counter + 1		


func not_there():
	emit_signal("notthere")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func handle_string(s):
	$click.play()
	var pos = temp.find(s)
	if pos != -1:
		for i in range(pos, length):
			if temp.substr(i, 1) == s:
				arr_labels[i].text = s
		temp = temp.replace(s, "/")		
		alpha.append(s)
	elif alpha.find(s) != -1:
		pass
	else:
		emit_signal("notthere")

	win()

func win():
	var slash_counter = 0
	for i in temp:
		if i == "/":
			slash_counter = slash_counter + 1	
	if slash_counter == length:
		print("ganaste oezi")
		emit_signal("youwin")

