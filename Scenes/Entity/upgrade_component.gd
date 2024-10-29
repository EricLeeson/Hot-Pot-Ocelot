extends Node

@export var weapon: Weapon

func _on_experience_component_leveled() -> void:
	var upgrade: Weapon = weapon
	weapon.upgrade()
