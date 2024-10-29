extends Area2D
class_name HurtBox

signal damaged(damage)

func take_damage(attack: AttackParams):
	damaged.emit(attack)
