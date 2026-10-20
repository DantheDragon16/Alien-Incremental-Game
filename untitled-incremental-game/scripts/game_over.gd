extends Control
class_name GameOverUI

@onready var takedowns_label: Label 
@onready var total_gold_label: Label 

func update(total_gold: int, takedowns: int):
	total_gold_label = $Panel/Stats/TotalGold
	total_gold_label.text = "Total Gold: " + str(total_gold)
	takedowns_label = $Panel/Stats/Takedowns
	takedowns_label.text = "Takedowns: " + str(takedowns)

func _on_shop_pressed() -> void:
	EventBus.open_shop.emit()

func _on_play_pressed() -> void:
	EventBus.start_run.emit()

func _on_menu_pressed() -> void:
	EventBus.open_main_menu.emit()
