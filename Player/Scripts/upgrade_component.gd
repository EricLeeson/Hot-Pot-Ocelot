extends Node

@export var weapon: Weapon

@onready var level_up_screen = get_node("/root/Game/GUI/Control/LevelUp")

var upgrades: Array[PackedScene]

func _ready() -> void:
	on_upgraded()
	connect("updated_upgrades", Callable(level_up_screen, "on_updated_upgrades"))

signal updated_upgrades()

func on_upgraded():
	var parent = get_parent()
	for child in parent.get_children():
		if child is Weapon:
			upgrades.append_array(child.weapon_choices)
	updated_upgrades.emit()

func on_upgrade_selected(selection: PackedScene):
	var upgrade = selection.instantiate()
	if upgrade is BrothBullet:
		%BrothWeapon.upgrade(selection)
	elif upgrade is MeatBullet:
		%MeatWeapon.upgrade(selection)
	elif upgrade is VegetableBullet:
		%VegetableWeapon.upgrade(selection)
	elif upgrade is SpiceBullet:
		%SpiceWeapon.upgrade(selection)
	elif upgrade is NoodleBullet:
		%NoodleWeapon.upgrade(selection)
	else:
		print('invalid scene')
