extends Control

func _ready() -> void:
	if len(Global.savedScores.scores) > 0:
		$VBoxContainer/Scores.disabled = false

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_scores_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scores.tscn")

func _on_about_pressed() -> void:
	OS.shell_open("https://github.com/Silvester56/suikagon/blob/main/README.md")

func _on_quit_pressed() -> void:
	get_tree().quit()
