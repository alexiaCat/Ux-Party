extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _draw():
	var pos = $head_pos.position
	draw_circle(pos, 30, Color(0, 0, 0))

