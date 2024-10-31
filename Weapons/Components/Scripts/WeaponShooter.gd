extends Node2D

@onready var shooting_points: Array[Marker2D] = [$ShootingOrigin]
@onready var weapon: Weapon = get_parent()

@export var shooting_origin: Resource

func shoot(origin: Marker2D):
	var new_bullet = weapon.weapon_type.instantiate()
	new_bullet.global_position = origin.global_position
	new_bullet.global_rotation = origin.global_rotation
	
	
	
	origin.add_child(new_bullet)

func _on_timer_timeout() -> void:
	if weapon.weapon_type:
		for origin in shooting_points:
			shoot(origin)

func apply_upgrades(bullet: Bullet):
	bullet.damage = int(weapon.damage) 
	weapon.max_pierce = bullet.max_pierce
	weapon.projectile_velocity = bullet.projectile_velocity
