extends Node3D

enum weapon_type { PRIMARY, SECONDARY, TERTIARY }

@onready var bone_attachment = $BoneAttachment3D

const weapon_scenes = {
	1: "res://Scenes/Weapons/Primary/AssaultRifles/M4Try1.tscn",
	2: "res://Scenes/Weapons/Primary/Shotguns/EscopetaFea.tscn",
	3: "res://Scenes/Weapons/Secondary/Pistols/Prototype.tscn",
}

var current_weapon
var primary_weapon
var secondary_weapon
var tertiary_weapon


func _ready():
	load_weapon(3)
	load_weapon(1)

func load_weapon(weapon_id):
	var weapon_scene = weapon_scenes[weapon_id]
	if weapon_scene:
		var weapon = load(weapon_scene).instantiate()
		equip_weapon(weapon)
		var type = weapon.get_weapon_type()
		print("tipo arma: " + str(type))
		match type:
			weapon_type.PRIMARY:
				if primary_weapon:
					primary_weapon.queue_free()
				primary_weapon = weapon
				print("Asignado a PRIMARY")
			weapon_type.SECONDARY:
				if secondary_weapon:
					secondary_weapon.queue_free()
				secondary_weapon = weapon
				print("Asignado a SECONDARY")
			weapon_type.TERTIARY:
				if tertiary_weapon:
					tertiary_weapon.queue_free()
				tertiary_weapon = weapon
				print("Asignado a TERTIARY")
		equip_weapon(weapon)
	else:
		print("Error: Invalid weapon ID")


#func equip_weapon(weapon):
	#if current_weapon != weapon:
		#if current_weapon:
			#current_weapon = null
			#bone_attachment.get_child(0).queue_free()
		#current_weapon = weapon
		#bone_attachment.add_child(current_weapon)

func equip_weapon(weapon):
	if current_weapon != weapon:
		if current_weapon:
			bone_attachment.get_child(0).queue_free()  # Elimina el arma actual del bone_attachment
			current_weapon = null  # Limpia el current_weapon después de eliminar el arma
		if weapon:  # Asegúrate de que la nueva arma no sea null
			current_weapon = weapon
			bone_attachment.add_child(current_weapon)


func attach_to_bone(bone_name,skeleton, bone_index):
	#print(skeleton,bone_name)
	bone_attachment.set_external_skeleton(skeleton)
	bone_attachment.bone_name = bone_name

# weapons code

func shoot():
	if current_weapon:
		current_weapon.shoot()

func reload_weapon():
	current_weapon.reload_weapon()

# Getters --------------------------------------------
func get_primary_weapon():
	return primary_weapon

func get_secondary_weapon():
	return secondary_weapon

func get_tertiary_weapon():
	return tertiary_weapon
