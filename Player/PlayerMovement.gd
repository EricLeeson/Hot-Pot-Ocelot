extends Node

@export var movement_speed: int = 60
@onready var player: CharacterBody2D = get_parent()

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player.velocity = direction * movement_speed
	player.move_and_slide()
