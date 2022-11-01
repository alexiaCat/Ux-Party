extends Control


onready var popup = get_node("Modal_profile")
onready var new_file = $edit_profile

func _ready():
	Gamehandler.update_nombrejugador()



#modal profile
func _on_Myprofile_button_up():
	popup.visible = true


func _on_btn_exit_button_up():
	popup.visible = false


func _on_editar_nombre_pressed():
	new_file.show()
	popup.visible = false


func _on_btn_exit_pressed():
	popup.visible = true
	new_file.hide()


func _on_btn_acept_pressed():
	Gamehandler.nameplayer = $edit_profile/TextureRect/inputName.text
	popup.visible = true
	new_file.hide()
	Gamehandler.update_nombrejugador()
	$edit_profile/TextureRect/inputName.clear()
