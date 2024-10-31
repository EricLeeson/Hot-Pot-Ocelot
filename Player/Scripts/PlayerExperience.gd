extends Node

@export var experience_per_level: int
@export var pickupBox: Area2D
@export var exp_interval: int

@onready var exp = ExpParams.new()

signal leveled(exp: ExpParams)
signal exp_collected(exp: ExpParams)

func _ready() -> void:
	exp.current_level = 1
	exp.current_exp = 0
	exp.min_exp = 0
	exp.max_exp = exp_interval

func _on_collect_area_collect_experience(amount: int) -> void:
	exp.current_exp += amount
	exp_collected.emit(exp)
	if exp.current_exp >= exp.max_exp:
		level_up()

func level_up():
	exp.current_level += 1
	exp.min_exp = exp.max_exp
	exp.max_exp = exp.max_exp * experience_per_level
	leveled.emit(exp)
	
