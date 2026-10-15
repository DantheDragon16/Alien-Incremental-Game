extends Control
class_name MainMenu

func _on_start_run_pressed() -> void:
	EventBus.start_run.emit()

func _on_shop_pressed() -> void:
	EventBus.open_shop.emit()

func _on_quit_pressed() -> void:
	get_tree().quit()
