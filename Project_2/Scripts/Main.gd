extends Spatial
signal win

var mathClass = load("res://Scripts/classes/math.gd")
var math = mathClass.new()
onready var end = get_node("End")
onready var player = get_node("Player")
onready var camera = get_node("Camera")
onready var label = get_node("Camera/Label")
var isRun = true

		
func _ready():
	label.visible = false

func _process(delta):
	if isRun:
		var pp = player.translation
		var pe = end.translation
		if math.mod(math.mod(pp.z) - math.mod(pe.z)) < 2 and math.mod(math.mod(pp.y)-math.mod(pe.y)) < 2:
			label.text = "You've won"
			label.visible = true
			isRun = false
		camera.translation.z = player.translation.z-3
		camera.translation.y = player.translation.y+3.5
		if player.translation.y < -10:
			label.text = "You lose"
			label.visible = true
			isRun = false
