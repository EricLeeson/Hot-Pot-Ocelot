extends Panel

@onready var player_weapons = get_node("/root/Game/Ocelot_Player/Weapons")

#func _ready() -> void:
	#for child in player_weapons.get_children().slice(1):
		#var upgrader = child.get_child(-1)
		#upgrader.upgraded.connect(update_weapon)
		#upgrader.new_upgrade.connect(add_new_weapon)

func update_weapon(weapon: Weapon):
	pass
	
func add_new_weapon(weapon: Weapon):
	print('hi')
	var node = get_node(str(weapon.name)+"/TextureRect")
	node.texture = weapon.icon
