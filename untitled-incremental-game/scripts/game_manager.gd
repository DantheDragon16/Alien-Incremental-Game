extends Node2D
class_name GameManager

# Referencing connected scenes
var weapon_manager_scene: PackedScene = load("res://scenes/weapon_manager.tscn")
var enemy_scene: PackedScene = load("res://scenes/enemy_basic.tscn")
var game_over_scene: PackedScene = load("res://scenes/game_over.tscn")

var max_health:int = 3
var health: int = 3
var damage_multipler:int = 1
var attack_speed:int = 1
var reward: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_enemy(get_random_pos())
	
	# Instantiate weapon controls
	var weapon: WeaponManager = weapon_manager_scene.instantiate()
	add_child(weapon)
	
	EventBus.damage_player.connect(damage)

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
	
func damage(dam: int) -> void:
		health -= dam
		print(health)
		if health <= 0:
			EventBus.game_over.emit(reward)
