extends Node2D
class_name EnemyBasic

var _player: PlayerManager
var attack_ready: bool = true
var damage: int = 1
var speed: float = 1
var scale_factor: float = 1

var initial_distance: float = 10

## The distance of the enemy from the player
var dist_from_player: float = initial_distance:
	set(value):
		dist_from_player = value
		if dist_from_player <= 1:
			
			attack(damage)

## The health value of the enemy
var health = 3:
	set(value):
		health = maxi(0,value)
		if health <= 0:
			death()

func _process(_delta: float) -> void:
	if dist_from_player > 1:
		approach_player()

func set_pos(_pos: Vector2):
	global_position = _pos

## Unloads the enemy 
func death():
	queue_free()

## Changes the health value
func take_damage(damage: int) -> void:
	health -= damage

## Deals damage to the player
func attack(_damage: int) -> void:
	print("attack triggering")
	if attack_ready:
		# Deal damage to the player
		await get_tree().create_timer(1).timeout
		print("Attacking player")
		_player.damage(_damage)
		attack_ready = false
		
		# attack cooldown
		await get_tree().create_timer(1).timeout
		attack_ready = true
		attack(_damage)

func approach_player() -> void:
	# Moves its position marker closer to the player
	dist_from_player -= speed
	# Scales the sprite based on distance
	if dist_from_player <= 0:
		scale_factor = 10
	else:
		scale_factor = initial_distance / dist_from_player
	
	
	scale = Vector2(scale_factor, scale_factor)
	
