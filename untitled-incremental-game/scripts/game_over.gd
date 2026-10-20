extends Control
class_name GameOverUI

@onready var rewards_label: Label = $Panel/Stats/Rewards
@onready var takedowns_label: Label = $Panel/Stats/Takedowns
@onready var total_currency_label: Label = $Panel/Stats/TotalCurrency
var current_total: int = 10
var reward:int = 5

func setup(player_game_stats: Array) -> void:
	rewards_label.text = "Rewards: " + str(reward)
	takedowns_label.text = "Takedowns: " + str(player_game_stats[1])
	total_currency_label.text = str(player_game_stats[0] + current_total)

func _on_shop_pressed() -> void:
	EventBus.open_shop.emit()

func _on_play_pressed() -> void:
	EventBus.start_run.emit()

func _on_menu_pressed() -> void:
	EventBus.open_main_menu.emit()
