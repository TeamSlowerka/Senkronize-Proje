extends Node2D

func _process(delta):
	if Global.Level1 == true:
		$Level1Portal.visible = true
		$Level1Portal.monitoring = true
		$TileMap.visible = true
		
