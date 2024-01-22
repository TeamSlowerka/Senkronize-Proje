extends Area2D

func _on_Level1Portal_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/Level2.tscn")
