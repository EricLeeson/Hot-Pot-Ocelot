extends Area2D
class_name Weapon

@export var spread_angle: float
@onready var projectile_count: int = 1
@export var weapon_type: PackedScene
@export var weapon_choices: Array[PackedScene] = []

func _ready() -> void:
	if weapon_type:
		var bullet = weapon_type.instantiate()
		$ShootTimer.wait_time = bullet.fire_rate

func upgrade(weapon: PackedScene):
	$UpgradesComponent.upgrade(weapon)
