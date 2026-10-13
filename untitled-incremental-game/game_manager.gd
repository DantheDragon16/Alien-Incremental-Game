extends Node2D
class_name GameManager 
var weapon_manager_scene: PackedScene = load("res://scenes/weapon_manager.tscn")
var enemy_scene: PackedScene = load("res://scenes/enemy_basic.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_enemy(get_random_pos())
	var weapon: WeaponManager = weapon_manager_scene.instantiate()
	add_child(weapon)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
## spawns an enemy
func spawn_enemy(pos: Vector2) -> void:
	await get_tree().create_timer(2).timeout
	var enemy: EnemyBasic = enemy_scene.instantiate()
	add_child(enemy)
	enemy.set_pos(pos)
	spawn_enemy(get_random_pos())
	
func get_random_pos() -> Vector2:
	var random_x_pos: int = randi_range(50, 1000)
	var random_y_pos: int = randi_range(50, 550)
	var random_pos: Vector2 = Vector2(random_x_pos, random_y_pos)
	return random_pos
	
