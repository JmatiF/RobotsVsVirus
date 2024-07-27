extends Entity

# Movement
var speed = 50.0
var jump_velocity = 4.5

# Mouse
var look_sensivility : float = 5.0 # set para las confg ?

# Vectors
var mouseDelta = Vector2()
var ray_origin = Vector3()
var ray_target = Vector3()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Components
@onready var camera = $CameraController/Camera3D
@onready var collision_shape = $CollisionShape3D
@onready var skin_controller = $SkinController
@onready var weapon_controller = $WeaponController
@onready var health_bar = $CameraController/Camera3D/HealthBar/Bar

func _ready():
	max_hp = 100.0
	current_hp = 100.0
	health_bar.scale.x = 7 #7.8 = max
	holding("Holding.R")
	#holding("Holding.L")


func _process(delta):
	update_animation()
	

func _physics_process(delta):
	# Mouse movement
	mouse_movement()
	player_movement(delta)
	
	if Input.is_action_just_pressed("left_click"):
		weapon_controller.shoot()
	
	if Input.is_action_just_pressed("equip_1"):
		pass
		#holding("Holding.R")

func player_movement(delta):
	# Add the gravity.
	if not is_on_floor():
		#print("Not on floor")
		velocity.y -= gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("moveLeft", "moveRight", "moveForward", "moveBackward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()

func mouse_movement():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_length = 2000
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	ray_query.collide_with_areas = true
	var raycast_result = space.intersect_ray(ray_query)
	
	if not raycast_result.is_empty():
		var pos = raycast_result.position
		var look_at_me = Vector3(pos.x, position.y, pos.z)
		#collision_shape.look_at(look_at_me, Vector3.UP)
		skin_controller.look_at(look_at_me, Vector3.UP)
		#weapon_controller.look_at(look_at_me, Vector3.UP)
		#weapon_controller.rotation_degrees = skin_controller.rotation_degrees

func update_animation():
	if (velocity.x != 0 or velocity.z != 0):
		skin_controller.play_walk()
	elif (velocity.x == 0 and velocity.z == 0): 
		skin_controller.play_idle()

func holding(hold):
	var result = skin_controller.holding_bone(hold)
	if result:
		var bone_path = result[0]
		var bone_index = result[1]
		weapon_controller.attach_to_bone(hold, bone_path, bone_index)

# Override death
func death():
	print("Moriste")
	queue_free()
