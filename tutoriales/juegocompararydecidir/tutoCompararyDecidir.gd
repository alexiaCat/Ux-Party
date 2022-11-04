extends Control


onready var popup = get_node("TutoriaCyd")
var cont = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_flecha_izq_button_up():
	cont -= 1
	get_tree().get_nodes_in_group("tutorial")[0].set_frame(cont)


func _on_flecha_der_button_up():
	cont += 1
	get_tree().get_nodes_in_group("tutorial")[0].set_frame(cont)


func _on_Button_tutorial_button_up():
	popup.visible = true
	get_tree().get_nodes_in_group("salircyd")[0].disabled = true
	get_tree().get_nodes_in_group("botoncyd")[0].disabled = true
	get_tree().get_nodes_in_group("botoncyd")[1].disabled = true
	get_tree().get_nodes_in_group("timercyd")[0].stop()
	get_tree().get_nodes_in_group("tiemporespuesta")[0].stop()


func _on_btn_salir_button_up():
	popup.visible = false
	get_tree().get_nodes_in_group("salircyd")[0].disabled = false
	get_tree().get_nodes_in_group("botoncyd")[0].disabled = false
	get_tree().get_nodes_in_group("botoncyd")[1].disabled = false
	get_tree().get_nodes_in_group("timercyd")[0].start()
	get_tree().get_nodes_in_group("tiemporespuesta")[0].start()
