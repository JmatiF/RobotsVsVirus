extends Node3D
class_name WeaponBase

# Components 
var bullet = preload("res://Scenes/Weapons/Others/Bullet.tscn")


# Enum
enum weapon_type { PRIMARY, SECONDARY, TERTIARY }

var current_weapon_type : weapon_type


# Variables
var can_shoot = true
var max_ammo : int 
var current_ammo : int
var ammo_mag : int
var current_ammo_mag : int
var damage : float

func shoot():
	if can_shoot:
		var new_bullet = bullet.instantiate()
		new_bullet.setup(2000)
		new_bullet.global_transform = $"SpawnBullet".global_transform
		get_tree().root.add_child(new_bullet)  # Añade la bala a la escena principal
		current_ammo_mag -=1
		$AnimationPlayer.play("shoot")
		#can_shoot = false
		#await $AnimationPlayer.animation_finished
		#can_shoot=true

func _process(delta):
	if current_ammo_mag <= 0:
		can_shoot = false
		print("ab c")
		$"AnimationPlayer".play("reload")


func refill_mag():
	if current_ammo < ammo_mag:
		current_ammo_mag = current_ammo
		current_ammo = 0
	else:
		current_ammo -= ammo_mag
		current_ammo_mag = ammo_mag
	can_shoot_true()



# can_shoot

func can_shoot_true(): 
	can_shoot = true
func can_shoot_false(): 
	can_shoot = false


# Setters ---------------------------------------------------------------------------------
func set_weapon_type(new_type: weapon_type):
	current_weapon_type = new_type

func set_max_ammo(new_ammo: int):
	max_ammo = new_ammo

func set_current_ammo(new_current_ammo: int):
	current_ammo = new_current_ammo

func set_ammo_mag(new_ammo_mag: int):
	ammo_mag = new_ammo_mag

func set_current_ammo_mag(new_current_ammo_mag: int):
	current_ammo_mag = new_current_ammo_mag

# Getters ---------------------------------------------------------------------------------
func get_weapon_type():
	return current_weapon_type

func get_max_ammo():
	return max_ammo

func get_current_ammo():
	return current_ammo

func get_ammo_mag():
	return ammo_mag

func get_current_ammo_mag():
	return current_ammo_mag
