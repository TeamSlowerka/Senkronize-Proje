extends Node2D

func _process(_delta):
	if Global.Level2 == true:
		$Level1Portal.visible = true
		$Level1Portal.monitoring = true
