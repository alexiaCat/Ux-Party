extends Control


onready var popup = get_node("MenuTrivia")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_quit_button_up():
	popup.visible = true


func _on_btn_exit_button_up():
	popup.visible = false


func _on_Salir_button_up():
	Gamehandler.vidas_jugador -= 1
	get_tree().change_scene("res://main_map/Main_scene.tscn")
