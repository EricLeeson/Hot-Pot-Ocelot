extends Area2D
class_name Weapon

@export var spread_angle: float = 0.1
@export var weapon_type: Resource
@export var shooting_origin: Resource

@onready var shooting_points: Array[Marker2D] = [$ShootingOrigin]

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot(origin: Marker2D):
	var new_bullet = weapon_type.instantiate()
	new_bullet.global_position = origin.global_position
	new_bullet.global_rotation = origin.global_rotation
	origin.add_child(new_bullet)

func upgrade():
	var new_origin = shooting_origin.instantiate()
	new_origin.rotation = shooting_points[-1].rotation + spread_angle
	shooting_points.append(new_origin)
	for origin in shooting_points:
		origin.rotation -= spread_angle / 2
	add_child(new_origin)

func _on_timer_timeout() -> void:
	for origin in shooting_points:
		shoot(origin)
