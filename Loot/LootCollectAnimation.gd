extends Node

@onready var loot: Loot = get_parent()
var movement_speed = -1

func _physics_process(delta: float) -> void:
	if loot.target:
		loot.global_position = loot.global_position.move_toward(loot.target.global_position, movement_speed)
		movement_speed += 4 * delta
