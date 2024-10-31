extends Node

@export var animation_player: AnimationPlayer

@onready var enemy: Enemy = get_parent()
@onready var is_hurt: bool = false

func _physics_process(delta: float) -> void:
	var animation_direction = get_direction(enemy.velocity)
	
	if !animation_player.is_playing():
		is_hurt = false
	
	if enemy.velocity.length() > 0.0 and !is_hurt:
		walk(animation_direction)

func get_direction(velocity) -> String:
	if velocity.x < 0:
		return "Left"
	elif velocity.x > 0:
		return "Right"
	
	return ""

func walk(direction):
	animation_player.play(direction)
	
func _on_hurt_box_damaged(damage: Variant) -> void:
	is_hurt = true
	animation_player.play("Hurt"+get_direction(enemy.velocity))
