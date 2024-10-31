extends Node

@onready var player: Player = get_parent()
@export var animation: AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var animationDirection = get_direction(player.velocity)
	
	if player.velocity.length() > 0.0:
		animation.play(animationDirection)
	else:
		animation.stop()

func get_direction(velocity) -> String:
	var vertical = ""
	var horizontal = ""
	
	
	if velocity.y > 0:
		vertical = "Down"
	elif velocity.y < 0:
		vertical = "Up"
	
	if velocity.x < 0:
		horizontal = "Left"
	elif velocity.x > 0: 
		horizontal = "Right"
	
	return vertical + horizontal
