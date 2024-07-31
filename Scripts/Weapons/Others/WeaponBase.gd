extends Node3D
class_name WeaponBase

# Components 
var bullet = preload("res://Scenes/Weapons/Others/Bullet.tscn")

# Variables
var ammo : int 
var current_ammo : int
var ammo_mag : int
var current_ammo_mag : int

func shoot():
	var new_bullet = bullet.instantiate()
	new_bullet.setup(2000)
	new_bullet.global_transform = $"SpawnBullet".global_transform
	get_tree().root.add_child(new_bullet)  # Añade la bala a la escena principal


# Setters
func set_ammo(new_ammo: int):
	ammo = new_ammo

func set_current_ammo(new_current_ammo: int):
	current_ammo = new_current_ammo

func set_ammo_mag(new_ammo_mag: int):
	ammo_mag = new_ammo_mag

func set_current_ammo_mag(new_current_ammo_mag: int):
	current_ammo_mag = new_current_ammo_mag

# Getters
func get_ammo():
	return ammo

func get_current_ammo():
	return current_ammo

func get_ammo_mag():
	return ammo_mag

func get_current_ammo_mag():
	return current_ammo_mag
