extends KinematicBody

#Class with matematics
var mathClass = load("res://Scripts/classes/math.gd")
var math = mathClass.new()

onready var end = get_node("../End")
onready var player = get_node("../Player")
onready var vel = Vector3()
var jump_speed = 100
var gravity = 5
var speed = 1
var isRun = true

func _on_win():
	visible = false
	isRun = false
	
func _on_lose():
	visible = false
	isRun = false

func _physics_process(delta):
	if isRun:
		#Control
		if Input.is_action_pressed("ui_right"):
			#vel.z -= speed
			move_and_collide(Vector3(0,0,-0.3))
			player.rotation_degrees.y = 0
		elif Input.is_action_pressed("ui_left"):
			#vel.z += speed
			move_and_collide(Vector3(0,0,0.3))
			player.rotation_degrees.y = 180
		if Input.is_action_pressed("ui_up") and is_on_floor():
			vel.y += jump_speed
		
		#gravity
		vel.y -= gravity 
		vel = move_and_slide(vel, Vector3.UP)
