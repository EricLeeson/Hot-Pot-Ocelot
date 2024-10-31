extends TextureProgressBar

@onready var player_hp = get_node("/root/Game/Ocelot_Player/HealthComponent")

func _ready() -> void:
	if player_hp:
		player_hp.hurt.connect(update_bar)
		max_value = player_hp.max_health

func update_bar():
	value = player_hp.health
