extends Area2D
class_name Weapon

@export var spread_angle: float
@export var weapon_type: PackedScene
@export var weapon_choices: Array[PackedScene] = []

@onready var level: int = 0
@onready var projectile_count: int = 1

var weapon_name: String
var damage: float
var fire_rate: float
var projectile_velocity: float
var max_pierce: int
var icon: Texture2D


func _ready() -> void:
	if weapon_type:
		var bullet = weapon_type.instantiate()
		$ShootTimer.wait_time = bullet.fire_rate

func upgrade(weapon: PackedScene):
	$UpgradesComponent.upgrade(weapon)
