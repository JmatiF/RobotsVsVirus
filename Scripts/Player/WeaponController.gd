extends Node3D


const weapon_scenes = {
	1: "res://Scenes/Weapons/Primary/Robot0003.tscn",
	2: "res://Scenes/Weapons/Secondary/Robot0003.tscn",
	3:"res://Scenes/Weapons/Tertiary/Robot0003.tscn",
}

var current_weapon
var primary_weapon
var secondary_weapon
var tertiary_weapon


#func _ready():
#	load_weapon(1)

#func load_weapon(robot_id, type: String):
#	current_robot = load(robot_scenes[robot_id]).instantiate()
#	add_child(current_robot)
#	current_tree = current_robot.get_node("AnimationTree")


#func play_walk():
#	current_tree.set("parameters/movement/transition_request", "walk")

#func play_idle():
#	current_tree.set("parameters/movement/transition_request", "idle")
