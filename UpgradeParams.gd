extends Resource
class_name Upgrade

var level: int
var projectile_count: int
var projectile_speed: int
var damage: int
var fire_rate: float

func apply_upgrade(bullet: Bullet):
	bullet.level += 1
	projectile_count += 1
	damage *= 2
	projectile_speed *= 1.2
