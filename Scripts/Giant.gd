extends Area2D

func _process(_delta):
	check_and_set_visibility()

func check_and_set_visibility():
	if Global.coin >= 5:
		$Label.visible = true
		$AnimatedSprite.visible = true
	else:
		$Label.visible = false
		$AnimatedSprite.visible = false

func _on_Giant_body_entered(_body):
	if Global.coin >= 5:
		Global.coin -= 5
		Global.Level1 = true
		queue_free()
