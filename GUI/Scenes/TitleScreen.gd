extends Control

@onready var game = "res://bullet_game.tscn"

func _ready() -> void:
	$Animation.play()

func _on_play_button_pressed() -> void:
	var _game = get_tree().change_scene_to_file(game)

func _on_exit_button_pressed() -> void:
	get_tree().quit()
