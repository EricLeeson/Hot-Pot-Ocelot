extends Node

@export var movement_speed = 20

@onready var enemy: Enemy = get_parent()
@onready var player: Player = get_node("/root/Game/Ocelot_Player")

func _physics_process(delta: float) -> void:
	var direction = enemy.global_position.direction_to(player.global_position)
	enemy.velocity = direction * movement_speed
	enemy.move_and_slide()
