extends Node2D

var weapons: Array[WeaponType] = []

func _ready() -> void:
	weapons.append($BrothWeapon.weapon_type)
