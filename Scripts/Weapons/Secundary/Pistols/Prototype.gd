extends WeaponBase



func _ready():
	set_max_ammo(INF)
	set_ammo_mag(7)
	set_current_ammo_mag(7)
	set_current_ammo(70)
	set_weapon_type(weapon_type.SECONDARY)
	set_bullet_range(150)

