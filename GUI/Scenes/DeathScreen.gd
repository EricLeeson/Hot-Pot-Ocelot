extends Panel

@onready var player_hp = get_node("/root/Game/Ocelot_Player/HealthComponent")
@onready var new_game = "res://bullet_game.tscn"

func _ready() -> void:
	visible = false
	if player_hp:
		player_hp.death.connect(show_death_screen)


func show_death_screen():
	visible = true
	$ScoreLabel.text = "Score: " + str(%GameTimer.time)
	get_tree().paused = true


func _on_play_again_pressed() -> void:
	get_tree().paused = false
	var _game = get_tree().change_scene_to_file(new_game)


func _on_exit_pressed() -> void:
	get_tree().quit()
