extends WeaponBase



func _ready():
	set_max_ammo(20)
	set_ammo_mag(2)
	set_current_ammo_mag(2)
	set_current_ammo(16)
	set_weapon_type(weapon_type.PRIMARY)
	set_bullet_range(200)
