extends CharacterBody2D

@onready var player = get_node("/root/Game/Ocelot_Player")

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 30
	move_and_slide()
	
	var animationDirection = get_direction(velocity)
	
	if velocity.length() > 0.0:
		%SlimeAnimation.play(animationDirection)
	
func get_direction(velocity) -> String:
	if velocity.x < 0:
		return "Left"
	elif velocity.x > 0: 
		return "Right"
	
	return ""
