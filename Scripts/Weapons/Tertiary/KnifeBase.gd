extends Node3D
class_name KnifeBase

enum knife_attack_mode {SLASH, STAB}

var current_attack_mode : knife_attack_mode = knife_attack_mode.SLASH


var damage : float
var alternative_damage : float
var push_dir : Vector3
var push_dist : float

var can_shoot = true

func shoot():
	if can_shoot:
		find_parent_by_name(self, "Player").knife_animation(str(current_attack_mode))

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
	if body.has_method("take_push"):
		body.take_push(push_dir, push_dist)

func find_parent_by_name(node, target_name):
	var current_node = node
	while current_node:
		if current_node.name == target_name:
			return current_node
			print("node: " + str(current_node))
		current_node = current_node.get_parent()
	return null

# Setters ---------------------------------------------------------------------------------
func set_knife_attack_mode(new_mode : knife_attack_mode): current_attack_mode = new_mode

# Getters ---------------------------------------------------------------------------------
func get_knife_attack_mode() -> knife_attack_mode: return current_attack_mode
