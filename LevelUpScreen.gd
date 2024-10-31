extends Panel


@onready var upgrade_option: PackedScene = preload("res://UpgradeOption.tscn")

@onready var player_upgrades = get_node("/root/Game/Ocelot_Player/Weapons/UpgradeComponent")
@onready var spawner = get_node("/root/Game/EnemySpawner")

const NUM_UPGRADES = 3
var possible_upgrades

func _ready() -> void:
	visible = false
	possible_upgrades = player_upgrades.upgrades


func _input(event: InputEvent) -> void:
	if (event.is_action("left_stick_move")):
		if !option_is_hovered($UpgradeOptions.get_children()):
			$UpgradeOptions.get_child(0).grab_focus()
			

func _on_experience_component_leveled(exp: ExpParams) -> void:
	var upgrades = possible_upgrades.duplicate()
	upgrades.shuffle()
	upgrades = upgrades.slice(0, NUM_UPGRADES)
	for x in range(NUM_UPGRADES):
		var upgrade_button = upgrade_option.instantiate()
		
		upgrade_button.initialize(upgrades[x])
		$UpgradeOptions.add_child(upgrade_button)

	show()
	get_tree().paused = true

func on_updated_upgrades() -> void:
	for child in $UpgradeOptions.get_children():
		child.queue_free()
	hide()
	get_tree().paused = false
	
func option_is_hovered(options) -> bool:
	for option in options:
		if option.has_focus():
			return true
	return false
