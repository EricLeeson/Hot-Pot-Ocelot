extends CharacterBody2D
class_name Enemy

@export var damage: int = 1
@onready var loot: Node2D = get_node("/root/Game/Loot")

func _on_health_component_death() -> void:
	const EXP_DROP = preload("res:///Loot/Experience.tscn")
	var exp = EXP_DROP.instantiate()
	exp.global_position = global_position
	loot.call_deferred("add_child", exp)
	
	queue_free()
