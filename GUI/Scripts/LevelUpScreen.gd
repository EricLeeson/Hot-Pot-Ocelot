extends Panel


@onready var upgrade_option: PackedScene = preload("res://GUI/Scenes/UpgradeOption.tscn")

@onready var player_weapons = get_node("/root/Game/Ocelot_Player/Weapons")
@onready var spawner = get_node("/root/Game/EnemySpawner")

const NUM_UPGRADES = 3
var possible_upgrades
var player_upgrades
signal selected(weapon)

func _ready() -> void:
	visible = false
	player_upgrades = player_weapons.get_child(0)
	possible_upgrades = player_upgrades.upgrades
	selected.connect(player_upgrades.on_upgrade_selected)


func _input(event: InputEvent) -> void:
	if (event.is_action("left_stick_move")):
		if !option_is_hovered($UpgradeOptions.get_children()):
			$UpgradeOptions.get_child(0).grab_focus()
			

func _on_experience_component_leveled(exp: ExpParams) -> void:
	var weapons = player_weapons.get_children().slice(1)
	weapons.shuffle()
	weapons = weapons.slice(0, NUM_UPGRADES)
	for x in range(NUM_UPGRADES):
		var upgrade = weapons[x].weapon_choices.pick_random()
		var upgrade_button = upgrade_option.instantiate()
		
		upgrade_button.initialize(upgrade, weapons[x])
		$UpgradeOptions.add_child(upgrade_button)
		upgrade_button.selected.connect(self.on_selected)
		$"../WeaponHUD".hide()
		$"../TimeDisplay".hide()
	show()
	get_tree().paused = true

func on_selected(weapon: PackedScene):
	for child in $UpgradeOptions.get_children():
		child.queue_free()
	selected.emit(weapon)
	hide()
	$"../WeaponHUD".show()
	$"../TimeDisplay".show()
	get_tree().paused = false
	
func option_is_hovered(options) -> bool:
	for option in options:
		if option.has_focus():
			return true
	return false
