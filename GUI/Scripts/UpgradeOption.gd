extends Button


@export var weapon: PackedScene
@onready var player_upgrades = get_node("/root/Game/Ocelot_Player/Weapons/UpgradeComponent")

signal selected(upgrade: PackedScene)

#func _ready():
	#connect("selected", Callable(player_upgrades, "on_upgrade_selected"))

#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):
		#emit_signal("pressed")

func initialize(bullet_scene: PackedScene, weapon_choice: Weapon):
	weapon = bullet_scene
	if weapon_choice.weapon_name:
		set_icon(weapon_choice.icon)
		set_name_label(weapon_choice.weapon_name)
		set_level_label(weapon_choice.level)
		set_description(weapon_choice)
	else:
		var new_weapon = bullet_scene.instantiate()
		
		set_name_label(new_weapon.weapon_name)
		set_icon(new_weapon.icon)
		set_level_label(weapon_choice.level)
		set_description(new_weapon)
	
	
func set_level_label(level: int):
	if level > 0:
		%LevelDescription.text = "Level " + str(level) + " -> Level " + str(level + 1)
	else:
		%LevelDescription.text = "NEW!!!"
	
func set_name_label(txt: String):
	%NameLabel.text = txt
	
func set_icon(icon: Texture2D):
	%WeaponIcon.texture = icon

func set_description(new_weapon):
	var projectile_count_text = ""
	if new_weapon is Weapon:
		projectile_count_text = "Projectile Count: " + str(new_weapon.projectile_count)+ "\n" 
	var damage_text = "Damage: " + str(new_weapon.damage)
	var fire_rate_text = "\nFire Rate: " + str(new_weapon.fire_rate)
	var projectile_speed_text = "\nSpeed: " + str(new_weapon.projectile_velocity)
	var max_pierce_text = ""
	if (new_weapon.max_pierce > 0):
		max_pierce_text = "\nPierce Count: " + str(new_weapon.max_pierce)
		
	%DescriptionLabel.text = projectile_count_text + damage_text + fire_rate_text + projectile_speed_text + max_pierce_text

func _on_pressed() -> void:
	selected.emit(weapon)
