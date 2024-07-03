extends CharacterBody3D
class_name Entity

# Health
var current_hp : float
var max_hp : float

# Attack
var damage : float
var attack_dist : float
var attack_rate : float

# Components
@onready var timer = $Timer



func take_damage(damage: float):
	current_hp -= damage
	if current_hp <= 0:
		death()

func death():
	queue_free()
