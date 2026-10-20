extends Node

signal open_shop()
signal open_main_menu()
signal start_run()
signal game_over(reward: int)
signal damage_player(damage:int)

func remove_warnings() -> void:
	open_shop.emit()
	open_main_menu.emit()
	start_run.emit()
	game_over.emit(0)
	damage_player.emit(0)
