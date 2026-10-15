extends Node

signal open_shop()
signal open_main_menu()
signal start_run()

func remove_warnings() -> void:
	open_shop.emit()
	open_main_menu.emit()
	start_run.emit()
