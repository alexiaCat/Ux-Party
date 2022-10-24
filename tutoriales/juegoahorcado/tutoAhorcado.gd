extends Control


onready var popup = get_node("TutoriaAhorcado")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_tutorial_button_up():
	popup.visible = true
	get_tree().get_nodes_in_group("contenedorptj")[0].visible = false
	get_tree().get_nodes_in_group("hangedtime")[0].stop()
	get_tree().get_nodes_in_group("btnquit")[0].disabled = true
	get_tree().get_nodes_in_group("btntuto")[0].disabled = true


func _on_btn_salir_button_up():
	popup.visible = false
	get_tree().get_nodes_in_group("contenedorptj")[0].visible = true
	get_tree().get_nodes_in_group("hangedtime")[0].start()
	get_tree().get_nodes_in_group("btnquit")[0].disabled = false
	get_tree().get_nodes_in_group("btntuto")[0].disabled = false
