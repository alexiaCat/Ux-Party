extends Control


onready var popup = get_node("TutorialDialog")
var cont = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tutorial_button_up():
	popup.visible = true


func _on_btn_salir_button_up():
	popup.visible = false


func _on_flecha_izq_button_up():
	cont -= 1
	get_tree().get_nodes_in_group("imga")[0].set_frame(cont)


func _on_flecha_der_button_up():
	cont += 1
	get_tree().get_nodes_in_group("imga")[0].set_frame(cont)


func _on_Tutorial_pressed():
	popup.visible = true


func _on_btn_salir_pressed():
	popup.visible = false
