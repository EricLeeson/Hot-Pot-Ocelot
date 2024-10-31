extends Node2D

@onready var weapon: Weapon = get_parent()

func _physics_process(delta: float) -> void:
	var enemies_in_range = weapon.get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = get_closest_enemy(enemies_in_range)
		weapon.look_at(target_enemy.global_position)

func get_closest_enemy(enemies_in_range):
	var closest: float
	var closest_enemy = null
	for enemy in enemies_in_range:
		var euclidean_squared = (global_position.x - enemy.global_position.x) ** 2 + (global_position.y - enemy.global_position.y) ** 2
		if !closest_enemy or euclidean_squared < closest:
			closest = euclidean_squared
			closest_enemy = enemy
			
	return closest_enemy
