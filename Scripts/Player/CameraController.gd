extends Node3D

@onready var camera = $Camera3D
# cam 1p position 0 ; 3.044 ; -0.968
# cam 1p rotation 0 ; 0 ; 0
# cam 1p scale 1 ; 1 ; 1


# Isometric 
var initial_camera_position = Vector3(0, 22, 6)
var fixed_camera_rotation = Vector3(-75, 0, 0)


func _ready():
	camera.position = initial_camera_position
	camera.rotation_degrees = fixed_camera_rotation

