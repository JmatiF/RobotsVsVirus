extends Node3D

const robot_scenes = {
	1: "res://Scenes/Robots/Robot0003.tscn",
	2: "res://Scenes/Robots/Robot0004.tscn",
	3: "res://Scenes/Robots/Robot0004.2.tscn",
}

var current_robot
var current_tree

func _ready():
	load_robot(2)

func load_robot(robot_id):
	if current_robot:
		current_robot.queue_free()
	current_robot = load(robot_scenes[robot_id]).instantiate()
	add_child(current_robot)
	current_tree = current_robot.get_node("AnimationTree")


func holding_bone(bone_name):
	if current_robot:
		var skeleton = current_robot.get_node("Esqueleto/Skeleton3D")
		if skeleton:
			var bone_index = skeleton.find_bone(bone_name)
			if bone_index != -1:
				#print(bone_index)
				return [skeleton.get_path(),bone_index]
	return null

func play_walk():
	current_tree.set("parameters/movement/transition_request", "walk")

func play_idle():
	current_tree.set("parameters/movement/transition_request", "idle")

func play_holding(weapon_reload_animation):
	print("NO creo que el problema este acá")
	current_tree.set("parameters/holding/transition_request", str(weapon_reload_animation))
