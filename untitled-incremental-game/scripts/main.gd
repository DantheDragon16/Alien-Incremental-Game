extends Node
class_name Main
var game_manager_scene: PackedScene = load("res://scenes/game_manager.tscn")
var main_menu_scene: PackedScene = load("res://scenes/main_menu.tscn")
var shop_scene: PackedScene = load("res://scenes/shop_ui.tscn")
var game_over_scene: PackedScene = load("res://scenes/game_over.tscn")

var gold_count:int = 0

var current_scene: Node
var initial_scene: PackedScene = main_menu_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.start_run.connect(start_run)
	EventBus.open_shop.connect(open_shop)
	EventBus.open_main_menu.connect(open_main_menu)
	EventBus.game_over.connect(open_game_over)
	#Instantiates the initial scene
	current_scene = initial_scene.instantiate()
	add_child(current_scene)

func start_run() -> void:
	current_scene.queue_free()
	current_scene = game_manager_scene.instantiate()
	add_child(current_scene)

func open_shop() -> void:
	current_scene.queue_free()
	current_scene = shop_scene.instantiate()
	add_child(current_scene)

func open_main_menu() -> void:
	current_scene.queue_free()
	current_scene = main_menu_scene.instantiate()
	add_child(current_scene)
	
func open_game_over() -> void:
	current_scene.queue_free()
	current_scene = game_over_scene.instantiate()
	add_child(current_scene)
