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

# Animation var 
var current_animation : String = "holding_knife"
var is_this_animated : bool = true

#func _ready():
	#ejecute_animation("holding_knife")

func _process(delta):
	ejecute_animation(current_animation)

func shoot():
	if can_shoot == true:
		can_shoot_false()
		set_current_animation("slash_knife")
		await get_tree().create_timer(0.833).timeout
		set_current_animation("holding_knife")
		can_shoot_true()

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

func ejecute_animation(animation):
	if is_this_animated:
		find_parent_by_name(self,"Player").animation_holding(animation)

func can_shoot_true(): 
	can_shoot = true
func can_shoot_false(): 
	can_shoot = false






# Setters ---------------------------------------------------------------------------------
func set_weapon_type(new_type: weapon_type): current_weapon_type = new_type
func set_current_animation(new_animation: String): current_animation = new_animation
func set_is_this_animated(is_animated: bool): is_this_animated = is_animated
# Getters ---------------------------------------------------------------------------------
func get_weapon_type(): return current_weapon_type
func get_current_animation() -> String: return current_animation
func get_is_this_animated() -> bool: return is_this_animated
