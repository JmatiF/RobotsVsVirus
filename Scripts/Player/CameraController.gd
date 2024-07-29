extends Node3D

@onready var camera = $Camera3D
# cam 1p position 0 ; 3.044 ; -0.968
# cam 1p rotation 0 ; 0 ; 0
# cam 1p scale 1 ; 1 ; 1

# Enum
enum CameraType { ISOMETRIC, THIRD_PERSON, FIRST_PERSON }

# Camera type
var camera_type = CameraType.ISOMETRIC

# Isometric_1
var isometric_1_camera_position = Vector3(0, 22, 6)
var isometric_1_camera_rotation = Vector3(-75, 0, 0)

# Isometric_1_max_min_position
var max_isometric_1_position = Vector3(0, 22, 6) * 1.5
var min_isometric_1_position = Vector3(0, 22, 6) / 2

func _ready():
	match camera_type:
		CameraType.ISOMETRIC:
			camera.position = isometric_1_camera_position
			camera.rotation_degrees = isometric_1_camera_rotation
		CameraType.THIRD_PERSON:
			pass
		CameraType.FIRST_PERSON:
			pass

func _process(delta):
	match camera_type:
		CameraType.ISOMETRIC:
			position_isometric_1()
			camera.position = isometric_1_camera_position
		CameraType.THIRD_PERSON:
			pass
		CameraType.FIRST_PERSON:
			pass

func position_isometric_1():
	if (Input.is_action_just_pressed("increase")) and isometric_1_camera_position < max_isometric_1_position:
		isometric_1_camera_position += isometric_1_camera_position/5
	if (Input.is_action_just_pressed("decrease")) and isometric_1_camera_position > min_isometric_1_position:
		isometric_1_camera_position -= isometric_1_camera_position/5
