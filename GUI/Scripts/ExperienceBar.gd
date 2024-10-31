extends TextureProgressBar

@onready var player_exp = get_node("/root/Game/Ocelot_Player/ExperienceComponent")

func _ready() -> void:
	if player_exp:
		player_exp.exp_collected.connect(update_value)
		player_exp.leveled.connect(update_limits)
		max_value = player_exp.exp_interval

func update_value(exp: ExpParams) -> void:
	value = exp.current_exp

func update_limits(exp: ExpParams) -> void:
	min_value = exp.min_exp
	max_value = exp.max_exp
	update_label(exp)

func update_label(exp: ExpParams):
	%ExpBarLabel.text = "Level " + str(exp.current_level)
