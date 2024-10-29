extends Area2D

class_name Loot

@onready var collected: bool = false
@onready var target: Area2D = null

func pickup(pickup_target: Area2D):
	target = pickup_target
