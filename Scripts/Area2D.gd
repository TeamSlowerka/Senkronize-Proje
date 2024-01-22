extends Area2D



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
		Global.coin = 0
		Global.Level1 = false
