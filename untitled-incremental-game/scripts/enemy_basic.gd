extends Node2D
class_name EnemyBasic

signal request_attack(_damage: int)
signal on_death(enemy: EnemyBasic)
var attack_ready: bool = true
var damage: int = 1
var speed: float = 1
var scale_factor: float = 1
var gold_given: int = 1

@onready var attack_sprite: Sprite2D = $AttackSprite

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
	on_death.emit(self)
	queue_free()

## Changes the health value
func take_damage(_damage: int) -> void:
	health -= _damage

## Deals damage to the player
func attack(_damage: int) -> void:
	print("attack triggering")
	if attack_ready:
		# Deal damage to the player
		await get_tree().create_timer(1).timeout
		print("Attacking player")
		attack_sprite.visible = true
		print("visible attack")
		await get_tree().create_timer(0.1).timeout
		request_attack.emit(damage)
		attack_ready = false
		attack_sprite.visible = false
		print("invisible attack")
		
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
	
