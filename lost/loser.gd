extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_btn_volver_button_up():
	get_tree().change_scene("res://main_map/Main_scene.tscn")
