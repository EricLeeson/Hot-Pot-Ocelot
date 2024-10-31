extends Node2D

@export var shooting_origin: Resource

@onready var weapon: Weapon = get_parent()
@onready var shooting_component = %ShootingComponent
@onready var player_upgrades = get_node("/root/Game/Ocelot_Player/Weapons/UpgradeComponent")
@onready var weapon_hud = get_node("/root/Game/GUI/WeaponHUD")


signal new_upgrade(weapon: Weapon)
signal upgraded(weapon: Weapon)

func _ready() -> void:
	connect("upgraded", Callable(weapon_hud, "update_weapon"))
	connect("new_upgrade", Callable(weapon_hud, "add_new_weapon"))
	
func upgrade(upgrade: PackedScene):
	var bullet = upgrade.instantiate()
	if !weapon.weapon_type:
		weapon.weapon_type = upgrade
		weapon.weapon_choices = [upgrade]
		%ShootTimer.wait_time = bullet.fire_rate
		load_weapon(bullet)
	else:
		add_projectile()
		apply_upgrades()
		upgraded.emit(weapon)

func load_weapon(upgrade: Bullet):
	weapon.level = 1
	weapon.damage = upgrade.damage
	weapon.fire_rate = upgrade.fire_rate
	weapon.max_pierce = upgrade.max_pierce
	weapon.projectile_velocity = upgrade.projectile_velocity
	weapon.icon = upgrade.icon
	weapon.weapon_name = upgrade.weapon_name
	new_upgrade.emit(weapon)

func add_projectile():
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

func apply_upgrades():
	weapon.level += 1
	weapon.damage *= 1.5
	weapon.fire_rate *= 0.8
	%ShootTimer.wait_time = weapon.fire_rate
	if (weapon.max_pierce > 0):
		weapon.max_pierce += 1
	weapon.projectile_velocity *= 1.1
