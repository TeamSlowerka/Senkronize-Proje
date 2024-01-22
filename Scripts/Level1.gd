extends Node2D

var reset = false

func _process(_delta):
	if reset:
		get_tree().reload_current_scene()
		Global.coin = 0
		Global.Level1 = false

func _input(event):
	if event.is_action_pressed("R"):
		reset = true

	if event.is_action_released("R"):
		reset = false
