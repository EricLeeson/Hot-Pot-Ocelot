extends Node

@onready var enemy: Enemy = get_parent()

func _physics_process(delta: float) -> void:
	var animationDirection = get_direction(enemy.velocity)
	
	if enemy.velocity.length() > 0.0:
		%SlimeAnimation.play(animationDirection)

func get_direction(velocity) -> String:
	if velocity.x < 0:
		return "Left"
	elif velocity.x > 0:
		return "Right"
	
	return ""
