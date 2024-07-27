extends Node3D
class_name WeaponBase

var bullet = preload("res://Scenes/Weapons/Others/Bullet.tscn")

func shoot():
	var new_bullet = bullet.instantiate()
	new_bullet.setup(2000)
	new_bullet.global_position = $"SpawnBullet".global_position
	get_tree().root.add_child(new_bullet)  # Añade la bala a la escena principal
