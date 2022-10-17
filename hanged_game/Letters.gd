extends Node2D

export (String) var input
var line = preload("res://hanged_game/Letters.tscn")
onready var apretarletra_s : AudioStreamPlayer = get_node("click_letter")


var arr_labels = []
var alpha = []
var arr_spaces = []
var words = ["UX", "EXPERIENCIA"]

var length
var temp

signal notthere
signal youwin
signal mayoi
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	input = words[randi() % words.size()]
	temp = input
	arr_labels.clear()
	alpha.clear()
	arr_spaces.clear()
	
	temp = temp.replace(" ", "/")
	
	initialize()
		
	temp = temp.replace("/", "")
	length = temp.length()


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
	apretarletra_s.play()
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


