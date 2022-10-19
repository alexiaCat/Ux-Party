extends Control


onready var popup = get_node("Modal_profile")


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	


func _on_Myprofile_button_up():
	popup.visible = true


func _on_btn_exit_button_up():
	popup.visible = false
