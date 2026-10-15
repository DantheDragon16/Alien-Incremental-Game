extends Node
class_name Main
var game_manager_scene: PackedScene = load("res://scenes/game_manager.tscn")
var main_menu_scene: PackedScene = load("res://scenes/main_menu.tscn")

var gold_count:int = 0


var initial_scene:PackedScene = main_menu_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#Instantiates the initial scene
	var current_scene: Node = initial_scene.instantiate()
	add_child(current_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
