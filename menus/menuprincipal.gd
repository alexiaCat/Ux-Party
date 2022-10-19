extends Control


onready var popup = get_node("Modal_config")



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_btn_exit_button_up():
	popup.visible = false


func _on_Config_button_up():
	popup.visible = true
