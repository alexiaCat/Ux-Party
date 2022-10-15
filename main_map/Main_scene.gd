extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	Gamehandler.update_vidas()


func _on_Level1_pressed():
	get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level2_pressed():
	if(Gamehandler.level1 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level3_pressed():
	if(Gamehandler.level2 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level4_pressed():
	if(Gamehandler.level3 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level5_pressed():
	if(Gamehandler.level4 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level6_pressed():
	if(Gamehandler.level5 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level7_pressed():
	if(Gamehandler.level6 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level8_pressed():
	if(Gamehandler.level7 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")


func _on_Level9_pressed():
	if(Gamehandler.level8 == false):
		print("no puedes ingresar")
	else:
		get_tree().change_scene("res://hanged_game/Main_hanged_game.tscn")
