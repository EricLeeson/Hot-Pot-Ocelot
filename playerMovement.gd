extends CharacterBody2D

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 60
	move_and_slide()
	
	var animationDirection = get_direction(velocity)
	
	if velocity.length() > 0.0:
		%OcelotWalkAnimation.play(animationDirection)
	else:
		%OcelotWalkAnimation.stop()
	
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
