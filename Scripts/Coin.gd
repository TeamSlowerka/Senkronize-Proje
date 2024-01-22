extends Area2D

func _ready():
	$AnimationPlayer.play("CoinAnim")

func _on_Coin_body_entered(body):
	if body.name == "Player":
		Global.coin += 5
		queue_free()
