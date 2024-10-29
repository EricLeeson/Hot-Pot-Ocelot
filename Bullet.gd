extends WeaponType
class_name Bullet

@export var projectile_velocity: int = 200
@export var max_range: int = 400
@export var max_pierce: int = 1

var travel_distance = 0
var pierce_count = 0

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	
	position += direction * projectile_velocity * delta
	travel_distance += projectile_velocity * delta
	
	if travel_distance > max_range:
		queue_free()

func _on_hit_box_enemy_hit() -> void:
	pierce_count += 1
	if pierce_count >= max_pierce:
		queue_free()
