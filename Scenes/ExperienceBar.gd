extends TextureProgressBar

func update_value(exp: ExpParams) -> void:
	value = exp.current_exp

func update_limits(exp: ExpParams) -> void:
	min_value = exp.min_exp
	max_value = exp.max_exp
	update_label(exp)

func update_label(exp: ExpParams):
	%ExpBarLabel.text = "Level " + str(exp.current_level)
