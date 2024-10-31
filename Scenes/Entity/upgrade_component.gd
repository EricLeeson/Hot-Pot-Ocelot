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
	print("updated")
	print(%MeatWeapon.weapon_type)
	updated_upgrades.emit()

func on_upgrade_selected(selection: PackedScene):
	var upgrade = selection.instantiate()
	if upgrade is BrothBullet:
		print('broth')
		%BrothWeapon.upgrade(selection)
	elif upgrade is MeatBullet:
		print('meat')
		%MeatWeapon.upgrade(selection)
	else:
		print('nothin')
