extends Node2D
class_name GameManager

# Referencing connected scenes
var weapon_manager_scene: PackedScene = load("res://scenes/weapon_manager.tscn")
var enemy_scene: PackedScene = load("res://scenes/enemy_basic.tscn")
var player_scene: PackedScene = load("res://scenes/player_manager.tscn")
var game_over_scene: PackedScene = load("res://scenes/game_over.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_enemy(get_random_pos())
	
	# Instantiate weapon controls
	var weapon: WeaponManager = weapon_manager_scene.instantiate()
	add_child(weapon)
	
	# Instantiate Player Stats
	var player: PlayerManager = player_scene.instantiate()
	add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
## spawns an enemy
func spawn_enemy(pos: Vector2) -> void:
	# Creates a 2 second gap between enemy spawns
	await get_tree().create_timer(2).timeout
	
	# Spawns an enemy at a random position
	var enemy: EnemyBasic = enemy_scene.instantiate()
	add_child(enemy, true)
	enemy.set_pos(pos)
	spawn_enemy(get_random_pos())
	
func get_random_pos() -> Vector2:
	var random_x_pos: int = randi_range(50, 1000)
	var random_y_pos: int = randi_range(50, 550)
	var random_pos: Vector2 = Vector2(random_x_pos, random_y_pos)
	return random_pos

## Ends the game, unloads game assets, and changes scene to game_over screen
func end_game(_reward: int) -> void:
	# Opens game over menu
	var game_over: Node2D = game_over_scene.instantiate()
	get_parent().add_child(game_over)
	# Adds gold
	get_parent().gold_count += _reward
	# kills self
	queue_free()
