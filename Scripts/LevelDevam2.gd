extends Node2D

func _ready():
		$Level2Portal.visible = false
		$Level2Portal.monitoring = false

func _process(_delta):
	if Global.Level2 == true:
		$Level2Portal.visible = true
		$Level2Portal.monitoring = true
