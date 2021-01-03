extends Spatial
signal win
signal lose

#Class with mathematics
var mathClass = load("res://Scripts/classes/math.gd")
var math = mathClass.new()

onready var end = get_node("End")
onready var player = get_node("Player")
onready var camera = get_node("Camera")
onready var label = get_node("Camera/Label")
var isRun = true


func _ready():
	label.visible = false

func _on_win():
	label.text = "You've won"
	label.visible = true
	isRun = false

func _on_lose():
	label.text = "You lose"
	label.visible = true
	isRun = false

func _process(delta):
	if isRun:
		
		var pp = player.translation #player's position
		var pe = end.translation #end's position
		if math.mod(math.mod(pp.z) - math.mod(pe.z)) < 2 and math.mod(math.mod(pp.y)-math.mod(pe.y)) < 2: # If player has colision with end
			emit_signal("win")
			
		if player.translation.y < -10: #lose
			emit_signal("lose")
			
		camera.translation.z = player.translation.z-3
		camera.translation.y = player.translation.y+3.5

