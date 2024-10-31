extends Button


@export var weapon: PackedScene
@onready var player_upgrades = get_node("/root/Game/Ocelot_Player/Weapons/UpgradeComponent")

signal selected(upgrade: PackedScene)

func _ready():
	connect("selected", Callable(player_upgrades, "on_upgrade_selected"))

#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):
		#emit_signal("pressed")

func initialize(bullet_scene: PackedScene):
	var new_weapon = bullet_scene.instantiate()
	weapon = bullet_scene
	
	set_name_label(new_weapon.weapon_name)
	set_icon(new_weapon.icon)
	set_level_label(new_weapon)
	
func set_level_label(new_weapon: WeaponType):
	%LevelDescription.text = "Level " + str(new_weapon.level) + " -> Level " + str(new_weapon.level + 1)
	
func set_name_label(txt: String):
	%NameLabel.text = txt
	
func set_icon(icon: Texture2D):
	%TextureRect.texture = icon

func _on_pressed() -> void:
	selected.emit(weapon)
