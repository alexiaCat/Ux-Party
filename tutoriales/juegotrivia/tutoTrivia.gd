extends Control


onready var popup = get_node("TutoriaTrivia")
var cont = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_flecha_izq_button_up():
	cont -= 1
	get_tree().get_nodes_in_group("image")[0].set_frame(cont)


func _on_flecha_der_button_up():
	cont += 1
	get_tree().get_nodes_in_group("image")[0].set_frame(cont)


func _on_Button_tutorial_button_up():
	popup.visible = true
	get_tree().get_nodes_in_group("tiempoquiz")[0].stop()
	get_tree().get_nodes_in_group("timertrivia")[0].stop()
	get_tree().get_nodes_in_group("triviaquit")[0].disabled = true
	get_tree().get_nodes_in_group("button")[0].disabled = true
	get_tree().get_nodes_in_group("button")[1].disabled = true
	get_tree().get_nodes_in_group("button")[2].disabled = true
	get_tree().get_nodes_in_group("button")[3].disabled = true


func _on_btn_salir_button_up():
	popup.visible = false
	get_tree().get_nodes_in_group("tiempoquiz")[0].start()
	get_tree().get_nodes_in_group("timertrivia")[0].start()
	get_tree().get_nodes_in_group("triviaquit")[0].disabled = false
	get_tree().get_nodes_in_group("button")[0].disabled = false
	get_tree().get_nodes_in_group("button")[1].disabled = false
	get_tree().get_nodes_in_group("button")[2].disabled = false
	get_tree().get_nodes_in_group("button")[3].disabled = false
