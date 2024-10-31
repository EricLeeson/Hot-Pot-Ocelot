extends Node2D

#@onready var player: Player = get_parent()

func _physics_process(delta: float) -> void:
	$ExpDropAnimation.play()
