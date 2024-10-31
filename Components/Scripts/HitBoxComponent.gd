extends Area2D
class_name HitBox

@onready var damage: int = get_parent().damage

signal enemy_hit

func _on_area_entered(area: Area2D) -> void:
	if area is HurtBox:
		var attack = AttackParams.new()
		attack.damage = damage
		if get_parent() is Enemy:
			#print(damage)
			#print(get_parent().damage)
			#print(attack.damage)
			attack.type = 1
		
		area.take_damage(attack)
		enemy_hit.emit()
