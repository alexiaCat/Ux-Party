extends Control


onready var editpopup = get_node("Window_name")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_editar_nombre_button_up():
	editpopup.visible = true
	get_tree().get_nodes_in_group("controlprofile")[0].hide()



func _on_btn_exit_button_up():
	editpopup.visible = false
	get_tree().get_nodes_in_group("controlprofile")[0].show()


func _on_btn_acept_button_up():
	editpopup.visible = false
	get_tree().get_nodes_in_group("controlprofile")[0].show()


func _on_inputName_text_entered(new_text):
	pass # Replace with function body.
