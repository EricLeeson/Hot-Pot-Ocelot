extends Node2D
class_name HealthComponent

@export var max_health: int
@export var hurtbox: HurtBox

@onready var character: CharacterBody2D = get_parent()
@onready var health = max_health

signal death

func _ready() -> void:
	if hurtbox:
		hurtbox.damaged.connect(on_damaged)

func on_damaged(attack: AttackParams):
	health -= attack.damage
	if health <= 0:
		death.emit()
