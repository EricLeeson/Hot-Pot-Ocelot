extends Area2D

@export var projectile_velocity = 200
@export var max_range = 400
@export var damage = 5

var travel_distance = 0

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	
	position += direction * projectile_velocity * delta
	travel_distance += projectile_velocity * delta
	
	if travel_distance > max_range:
		queue_free()
		

func _on_body_entered(body: Node2D) -> void:
	queue_free() # Replace with function body.
