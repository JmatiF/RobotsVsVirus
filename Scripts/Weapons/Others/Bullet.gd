extends Area3D
class_name Bullet

var distance = 0
const SPEED = 100
var damage : float
var push_dir : Vector3
var push_dist : float

@export var range = 200

func setup(range_of_weapon):
	range = range_of_weapon

func _physics_process(delta):
	#var direction = Vector3.RIGHT.rotated(rotation, rotation.y)  # Assuming isometric view
	var direction = global_transform.basis.y.normalized()
	
	position +=  (direction * SPEED * delta)
	distance += SPEED * delta
	
	if distance > range:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(damage)
	if body.has_method("take_push"):
		body.take_push(push_dir, push_dist)
