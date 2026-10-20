extends Control
#currently connected to nothing but will be used to 
signal attack_increased()
signal health_increased()

#Stores the players total gold and prices of the upgrades
var player_gold: int = 10
var attack_cost: int = 1
var health_cost: int = 1
#reference to the upgrade buttons to allow updating button text
@onready var attack_button: Button = $Panel/VBoxContainer/Attack
@onready var health_button: Button = $Panel/VBoxContainer/Health
@onready var gold_label: Label = $Panel/Gold

#On game start set the text of the two buttons 
func _ready() -> void:
	attack_button.text = "attack: " + str(attack_cost)
	health_button.text = "health: " + str(health_cost)
	gold_label.text = "gold: " + str(player_gold)

func open_shop(gold_total: int, _attack_cost: int, _health_cost: int ) -> void:
	player_gold = gold_total
	attack_cost = _attack_cost
	health_cost = _health_cost
	gold_label.text = "gold: " + str(player_gold)
	attack_button.text = "attack: " + str(attack_cost)
	health_button.text = "health: " + str(health_cost)
	
##Attempts to upgrade health by calling update health function 
func _on_attack_pressed() -> void:
	if player_gold >= attack_cost:
		update_shop(attack_button)

##Attempts to upgrade health by calling update health function 
func _on_health_pressed() -> void:
	if player_gold >= health_cost:
		update_shop(health_button)

## Takes a stat and checks if player can buy the upgrade before sending upgrade signal and updating relavant numbers
func update_shop(which_button: Button) -> void:
	var stat_name: String = which_button.name.to_lower()
	var stat_cost: int = get(stat_name + "_cost")
	if player_gold >= stat_cost:
		player_gold -= stat_cost
		gold_label.text = "gold: " + str(player_gold)
		stat_cost += 1
		which_button.text = stat_name + ": " + str(stat_cost)
		set(stat_name + "_cost", stat_cost)
		get(stat_name + "_increased").emit()

func _on_exit_pressed() -> void:
	EventBus.open_main_menu.emit()

func remove_warnings() -> void:
	attack_increased.emit()
	health_increased.emit()

func _on_play_pressed() -> void:
	EventBus.start_run.emit()
