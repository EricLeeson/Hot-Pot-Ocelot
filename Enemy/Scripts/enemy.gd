extends CharacterBody2D
class_name Enemy

@export var damage: int
@export var exp_amount: int

@onready var loot: Node2D = get_node("/root/Game/Loot")

func _on_health_component_death() -> void:
	const EXP_DROP = preload("res:///Loot/Experience.tscn")
	var exp = EXP_DROP.instantiate()
	exp.set_exp_amount(exp_amount)
	exp.global_position = global_position
	loot.call_deferred("add_child", exp)
	
	queue_free()
