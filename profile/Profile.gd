extends Control


onready var popup = get_node("Modal_profile")


func _ready():
	Gamehandler.update_nombrejugador()



#modal profile
func _on_Myprofile_button_up():
	popup.visible = true


func _on_btn_exit_button_up():
	popup.visible = false
