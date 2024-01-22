extends KinematicBody2D

var direction = Vector2()
var velocity = Vector2()
var speed = 100
var gravity = 1000
var jump_strength = 260

func _ready():
	pass

func _physics_process(delta):
	process_input()
	update_movement(delta)
	player_animation()

func process_input():
	direction = Vector2()
	if Input.is_action_pressed("D"):
		direction.x += 1
	if Input.is_action_pressed("A"):
		direction.x -= 1

	if is_on_floor() and Input.is_action_just_pressed("Space"):
		start_jump()
		return

func start_jump():
	velocity.y = -jump_strength

func update_movement(delta):
	velocity.x = direction.x * speed
	velocity.y += gravity * delta

	velocity = move_and_slide(velocity, Vector2.UP)

func player_animation():
	if is_on_floor():
		if direction.x != 0:
			$AnimatedSprite.flip_h = (direction.x < 0)
			$AnimatedSprite.play("Walk")
		else:
			$AnimatedSprite.play("Idle")
	else:
		$AnimatedSprite.play("Jump")
