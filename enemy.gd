extends CharacterBody2D

@export var movement_speed = 20
@export var hp = 10

@onready var player = get_node("/root/Game/Ocelot_Player")

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
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


func _on_hurt_box_hurt(damage: Variant) -> void:
	hp -= 1
	if hp <= 0:
		queue_free()
	print("Slime HP:", hp)
