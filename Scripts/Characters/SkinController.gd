extends Node3D

const robot_scenes = {
	1: "res://Scenes/Robots/Robot0003.tscn",
	2: "res://Scenes/Robots/Robot0004.tscn",
}

var current_robot

func _ready():
	load_robot(1)

func load_robot(robot_id):
	if current_robot:
		current_robot.queue_free()

	var current_robot = load(robot_scenes[robot_id]).instantiate()
	add_child(current_robot)



func walk():
	current_robot.get_node("AnimationTree").set("parameters/movement/transition_request", "walk")

func idle():
	current_robot.get_node("AnimationTree").set("parameters/movement/transition_request", "idle")
