extends CanvasLayer

@onready var health: Label = $GameUi/Health/Label
@onready var takedowns: Label = $Panel/HBoxContainer/Takedowns/Label
@onready var rewards: Label = $Panel/HBoxContainer/Rewards/Label

func on_health_changed(cur_health: int, max_health: int) -> void:
	health.text = str(cur_health) + "/" + str(max_health)

func on_takedown(_rewads: int, _takedowns: int) -> void:
	rewards.text = "rewards: " + str(_rewads)
	takedowns.text = "takedowns: " + str(_takedowns)
