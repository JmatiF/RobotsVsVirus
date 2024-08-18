extends WeaponBase



func _ready():
	set_max_ammo(INF)
	set_ammo_per_mag(7)
	set_current_ammo_per_mag(7)
	set_current_ammo(70)
	set_bullet_range(150)
	set_weapon_type(weapon_type.SECONDARY)
	set_reload_type(reload_type.RELOAD_1)
