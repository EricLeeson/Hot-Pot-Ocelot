extends Node

@export var experience_per_level: int
@export var pickupBox: Area2D

@onready var current_level = 1
@onready var current_exp: float = 0
@onready var next_level_exp: int = experience_per_level

signal leveled

func _on_collect_area_collect_experience(amount: int) -> void:
	current_exp += amount
	print("EXP until level up:", next_level_exp - current_exp)
	if current_exp >= next_level_exp:
		
		level_up()

func level_up():
	current_level += 1
	next_level_exp = next_level_exp * experience_per_level
	leveled.emit()
	
