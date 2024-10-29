extends Area2D

@export_enum("Cooldown", "HitOnce", "DisableHitBox") var HurtBoxType = 0

@onready var health_component = $HealthComponent
@onready var collision = $CollisionShape2D
@onready var disableTimer = $DisableTimer

signal hurt(damage)

func take_damage(attack: AttackParams):
	if health_component:
		health_component.take_damage(attack)

func _on_area_entered(area: Area2D) -> void:
	if area is HitBox:
		print("hi")
		if area.is_in_group("attack"):
			if not area.get("damage") == null:
				match HurtBoxType:
					0:
						collision.call_deferred("set", "disabled", true)
						disableTimer.start()
					1:
						pass
					2:
						if area.has_method("tempdisable"):
							area.tempdisable()
				var damage = area.damage
				emit_signal("hurt", damage)
							
		pass # Replace with function body.


func _on_disable_timer_timeout() -> void:
	collision.call_deferred("set", "disabled", false)
	pass # Replace with function body.