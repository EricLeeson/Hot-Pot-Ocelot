extends Node2D

@export var shooting_origin: Resource

@onready var weapon: Weapon = get_parent()
@onready var shooting_component = %ShootingComponent
@onready var player_upgrades = get_node("/root/Game/Ocelot_Player/Weapons/UpgradeComponent")

signal upgraded_weapon

func _ready() -> void:
	connect("upgraded_weapon", Callable(player_upgrades, "on_upgraded"))

func upgrade(upgrade: PackedScene):
	if !weapon.weapon_type:
		print('new weapon')
		weapon.weapon_type = upgrade
		weapon.weapon_choices = [upgrade]
		var bullet = upgrade.instantiate()
		%ShootTimer.wait_time = bullet.fire_rate
	else:
		var shooting_points = shooting_component.shooting_points
		var new_origin = shooting_origin.instantiate()
		weapon.projectile_count += 1
		if weapon.spread_angle > 0:
			new_origin.rotation = shooting_points[-1].rotation + weapon.spread_angle
			shooting_points.append(new_origin)
			for origin in shooting_points:
				origin.rotation -= weapon.spread_angle / 2
		else:
			shooting_points.append(new_origin)
			for x in range(weapon.projectile_count):
				shooting_points[x].rotation = (2 * PI / weapon.projectile_count) * x
		weapon.add_child(new_origin)
		upgraded_weapon.emit()
