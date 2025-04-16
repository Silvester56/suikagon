extends Node2D

func _process(delta: float) -> void:
	if $GameOverTimer.time_left > 0:
		$Area2D/Sprite2D.modulate = Color(1, 1, 1, 1 - $GameOverTimer.time_left / $GameOverTimer.wait_time)
	else:
		$Area2D/Sprite2D.modulate = Color(1, 1, 1, 0)

func _on_area_2d_body_entered(body: Node2D) -> void:
	$GameOverTimer.start()

func _on_area_2d_body_exited(body: Node2D) -> void:
	$GameOverTimer.stop()

func _on_game_over_timer_timeout() -> void:
	$GameOverScreen.show()
	get_tree().paused = true

func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
