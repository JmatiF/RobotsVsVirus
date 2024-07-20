extends Node3D

enum WeaponType { PRIMARY, SECONDARY, TERTIARY }

const weapon_scenes = {
	1: "res://Models/weapons/primary/AssaultRifles/M4 TRY 1.glb",
	2: "res://Scenes/Weapons/Secondary/Robot0003.tscn",
	3: "res://Scenes/Weapons/Tertiary/Robot0003.tscn",
}

var current_weapon
var primary_weapon
var secondary_weapon
var tertiary_weapon


func _ready():
	load_weapon(1,"primary")

func load_weapon(weapon_id, type: String):
	var weapon_scene = weapon_scenes[weapon_id]
	if weapon_scene:
		var weapon = load(weapon_scene).instantiate()
		match type:
			WeaponType.PRIMARY:
				if primary_weapon:
					primary_weapon.queue_free()
				primary_weapon = weapon
			WeaponType.SECONDARY:
				if secondary_weapon:
					secondary_weapon.queue_free()
				secondary_weapon = weapon
			WeaponType.TERTIARY:
				if tertiary_weapon:
					tertiary_weapon.queue_free()
				tertiary_weapon = weapon
		equip_weapon(weapon)
	else:
		print("Error: Invalid weapon ID")

func equip_weapon(weapon):
	if current_weapon:
		current_weapon.queue_free()
	current_weapon = weapon
	add_child(current_weapon)
