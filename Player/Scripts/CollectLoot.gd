extends Area2D

signal collect_experience(amount: int)

func _on_area_entered(area: Area2D) -> void:
	if area is Loot:
		if area is Experience:
			collect_experience.emit(area.exp_amount)
			area.queue_free()
