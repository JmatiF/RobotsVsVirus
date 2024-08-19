extends WeaponBase



func _ready():
	set_max_ammo(300)
	set_ammo_per_mag(60)
	set_current_ammo_per_mag(60)
	set_current_ammo(120)
	set_bullet_range(400)
	set_weapon_type(weapon_type.PRIMARY)
	set_reload_type("reload_m4")
	set_holding_type("holding_m4")
	set_current_animation(get_holding_type())
