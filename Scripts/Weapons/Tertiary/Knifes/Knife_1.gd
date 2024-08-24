extends KnifeBase

func _ready():
	set_weapon_type(weapon_type.TERTIARY)
	set_shoot_animation("slash_knife")
	set_hold_animation("holding_knife")
