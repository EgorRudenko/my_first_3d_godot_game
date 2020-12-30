extends KinematicBody

onready var vel = Vector3()
var jump_speed = 100
var gravity = 5
var speed = 1

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		#vel.z -= speed
		move_and_collide(Vector3(0,0,-0.3))
	elif Input.is_action_pressed("ui_left"):
		#vel.z += speed
		move_and_collide(Vector3(0,0,0.3))
	if Input.is_action_pressed("ui_up") and is_on_floor():
		vel.y += jump_speed
	vel.y -= gravity

	vel = move_and_slide(vel, Vector3.UP)
