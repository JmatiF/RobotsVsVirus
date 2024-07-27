extends Area3D
class_name Bullet

var distance = 0
const SPEED = 1000
@export var range = 1200
@export var bullet_direction = true

func setup(range_of_weapon):
	range = range_of_weapon

func _physics_process(delta):
	var direction = Vector3.RIGHT.rotated(rotation, rotation.y)  # Assuming isometric view
	#if bullet_direction:
		#print("front")
		#position += direction * SPEED * delta
	#else:
		#print("back")
		#position += direction * SPEED * delta * -1
	distance += SPEED * delta
	
	if distance > range:
		queue_free()

func bullet_dirr(direction):
	bullet_direction = direction

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
