extends Node2D

func _on_Play_button_pressed():
	get_tree().change_scene("res://main_map/Main_scene.tscn")


func _on_Config_button_pressed():
	get_tree().change_scene("res://menu_options.tscn")
