extends Control


# Declare member variables here. Examples:
# var a = 2
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
