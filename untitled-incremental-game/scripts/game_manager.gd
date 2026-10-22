extends Node2D
class_name GameManager

# Referencing connected scenes
var weapon_manager_scene: PackedScene = load("res://scenes/weapon_manager.tscn")
var enemy_scene: PackedScene = load("res://scenes/enemy_basic.tscn")
var game_over_scene: PackedScene = load("res://scenes/game_over.tscn")

# Player Statistics
## The maximum health the player gets in the run
var max_health:int = 3
## The current health of the player
var health: int = 3
## Scales player damage based on damage upgrades
var damage_multipler:int = 1
## Scales the cooldown for player attacks
var attack_speed:int = 1
## How much gold the player has earned this run
var reward: int = 0

var default_timer: float = 3.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	start_enemies(default_timer)
	# Instantiate weapon controls
	var weapon: WeaponManager = weapon_manager_scene.instantiate()
	add_child(weapon)
	
	# Connecting the signal for an attack hitting the player
	EventBus.damage_player.connect(damage)

## begins spawning enemies at an increasing speed
func start_enemies(timer: float) -> void:
	await get_tree().create_timer(timer).timeout
	spawn_enemy(get_random_pos())
	start_enemies(timer* 0.98)
	pass

## spawns an enemy at the specified position
func spawn_enemy(pos: Vector2) -> void:
	# Spawns an enemy at a random position
	var enemy: EnemyBasic = enemy_scene.instantiate()
	add_child(enemy, true)
	enemy.set_pos(pos)

func get_random_pos() -> Vector2:
	var random_x_pos: int = randi_range(50, 1000)
	var random_y_pos: int = randi_range(50, 550)
	var random_pos: Vector2 = Vector2(random_x_pos, random_y_pos)
	return random_pos

func set_player_stats(_mh:int, _dm:int, _as:int) -> void:
	max_health = _mh
	health = max_health
	damage_multipler = _dm
	attack_speed = _as
	
func damage(dam: int) -> void:
		health -= dam
		print(health)
		if health <= 0:
			EventBus.game_over.emit(reward)
