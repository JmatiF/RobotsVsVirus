extends Node3D
class_name KnifeBase

# Enum
enum weapon_type {PRIMARY,SECONDARY,TERTIARY}

# Enum var
var current_weapon_type : weapon_type

# Var
var damage : float
var alternative_damage : float
var push_dir : Vector3
var push_dist : float

# Shoots var
var can_shoot = true



func _ready():
	find_parent_by_name(self, "Player").animation_holding("holding_knife")

func shoot():
	if can_shoot:
		can_shoot_false()
		await find_parent_by_name(self, "Player").animation_holding("slash_knife")
		can_shoot_true()
		find_parent_by_name(self, "Player").animation_holding("holding_knife")

func alternative_shoot():
	pass

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


func can_shoot_true(): 
	can_shoot = true
func can_shoot_false(): 
	can_shoot = false

# Setters ---------------------------------------------------------------------------------
func set_weapon_type(new_type: weapon_type): current_weapon_type = new_type
# Getters ---------------------------------------------------------------------------------
func get_weapon_type(): return current_weapon_type
