extends Control


onready var popup = get_node("Modal_config")

signal opentuto

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	passemit_signal("opentuto")


func _on_btn_exit_button_up():
	popup.visible = false
	get_tree().get_nodes_in_group("escena")[0].visible = true




func _on_Config_button_button_up():
	popup.visible = true
	get_tree().get_nodes_in_group("escena")[0].visible = false
