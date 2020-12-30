extends Spatial


onready var player = get_node("Player")
onready var camera = get_node("Camera")

func _process(delta):
	camera.translation.z = player.translation.z-3
	camera.translation.y = player.translation.y+3.5
