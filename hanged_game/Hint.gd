extends Control


onready var ayuda = get_node("PopupMenu")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_hint_button_up():
	ayuda.visible = true
