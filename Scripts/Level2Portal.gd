extends Area2D

func _on_Level2Portal_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/Level3.tscn")
