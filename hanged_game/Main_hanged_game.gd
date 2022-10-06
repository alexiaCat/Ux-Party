extends Node2D

export (int) var playtime

var time_left = 60
var score = 500
var playing = false

signal start_game

func update_score(value):
	$Control/MarginContainer2/ScoreLabel.text = str(value)

func update_time(value):
	$Control/MarginContainer/HBoxContainer/TimeLabel.text = str(value)
	
