extends Node3D
class_name WeaponBase

# Components 
var bullet = preload("res://Scenes/Weapons/Others/Bullet.tscn")


# Enum
enum weapon_type {PRIMARY,SECONDARY,TERTIARY}


var current_weapon_type : weapon_type


var reload_type : String # Reload type


# Variables
var can_shoot = true
var max_ammo : int 
var current_ammo : int
var ammo_per_mag : int
var current_ammo_per_mag : int

# Shoots Variables Methods
var damage : float
var alternative_damage : float
var push_dir : Vector3
var push_dist : float

# Bullets Variables Methods
var bullet_range : float = 200

func shoot():
	if can_shoot:
		var new_bullet = bullet.instantiate()
		new_bullet.setup(bullet_range)
		new_bullet.global_transform = $"SpawnBullet".global_transform
		get_tree().root.add_child(new_bullet) 
		current_ammo_per_mag -=1
		$AnimationPlayer.play("shoot")
		#can_shoot = false
		#await $AnimationPlayer.animation_finished
		#can_shoot=true

func alternative_shoot():
	pass

func _process(delta):
	if current_ammo_per_mag <= 0:
		can_shoot_false()
		$"AnimationPlayer".play("reload")


func refill_mag():
	if current_ammo > 0:
		var ammo_needed = ammo_per_mag - current_ammo_per_mag
		
		if current_ammo <= ammo_needed:
			current_ammo_per_mag += current_ammo
			current_ammo = 0
		else:
			current_ammo_per_mag = ammo_per_mag
			current_ammo -= ammo_needed
		
		can_shoot_true()

func reload_weapon():
	if current_ammo_per_mag < ammo_per_mag:
		can_shoot_false()
		find_parent_by_name(self,"Player").animation_holding(reload_type)
		$"AnimationPlayer".play("reload")


func find_parent_by_name(node, target_name):
	var current_node = node
	while current_node:
		if current_node.name == target_name:
			return current_node
			print("node: " + str(current_node))
		current_node = current_node.get_parent()
	return null



# can_shoot

func can_shoot_true(): 
	can_shoot = true
func can_shoot_false(): 
	can_shoot = false

# Setters ---------------------------------------------------------------------------------
func set_bullet_range(new_range: float):
	bullet_range = new_range

func set_weapon_type(new_type: weapon_type):
	current_weapon_type = new_type

func set_reload_type(new_reload):
	reload_type = new_reload

func set_max_ammo(new_ammo: int):
	max_ammo = new_ammo

func set_current_ammo(new_current_ammo: int):
	current_ammo = new_current_ammo

func set_ammo_per_mag(new_ammo_per_mag: int):
	ammo_per_mag = new_ammo_per_mag

func set_current_ammo_per_mag(new_current_ammo_per_mag: int):
	current_ammo_per_mag = new_current_ammo_per_mag

# Getters ---------------------------------------------------------------------------------
func get_bullet_range():
	return bullet_range

func get_weapon_type():
	return current_weapon_type

func get_reload_type():
	return reload_type

func get_max_ammo():
	return max_ammo

func get_current_ammo():
	return current_ammo

func get_ammo_per_mag():
	return ammo_per_mag

func get_current_ammo_per_mag():
	return current_ammo_per_mag
