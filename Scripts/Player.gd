extends KinematicBody2D

var direction = Vector2()
var velocity = Vector2()
var normal_speed = 100
var gravity = 1000
var jump_strength = 260

const dash_speed = 350
const dash_length = 0.2

onready var dash = $Dash


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
	if Input.is_action_just_pressed("dash"):
		if Global.dash_yetenek == true:
			dash.start_dash(dash_length)
	
	var speed = dash_speed if dash.is_dashing() else normal_speed
	
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
