extends Node2D

func _ready():
	$TileMap.collision_layer = 0
	$TileMap.collision_mask = 0

func _process(_delta):
	if Global.Level1 == true:
		$Level1Portal.visible = true
		$Level1Portal.monitoring = true
		$TileMap.visible = true
		$TileMap.collision_mask = 1
		$TileMap.collision_layer = 1
