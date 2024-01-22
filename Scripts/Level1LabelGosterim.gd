extends Area2D

func _ready():
	$GeriGit.visible = false

func _on_LabelGosterim_body_entered(body):
	if body.name == "Player":
		$GeriGit.visible = true
