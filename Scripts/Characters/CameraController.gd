extends Node3D

# Variables
var look_sensivility : float = 5.0 # set para las confg ?
var min_look_angle : float = -70.0
var max_look_angle : float = 70.0

# Vectors
var mouseDelta = Vector2()

# Components
@onready var player = get_parent()
@onready var camera = $Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta: float):
	var rot = Vector3(-mouseDelta.y, mouseDelta.x, 0) * look_sensivility * delta
	
	
	camera.rotation_degrees.x += rot.x
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, min_look_angle, max_look_angle)
	
	player.rotation_degrees.y -= rot.y
	
	mouseDelta = Vector2()

func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		mouseDelta = event.relative
