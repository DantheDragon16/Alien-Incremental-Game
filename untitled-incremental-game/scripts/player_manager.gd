extends Node2D
## A class that defines player stats, 
## used when calculating with player actions in game
class_name PlayerManager

var parent: Node2D

func _ready() -> void:
	parent = get_parent()
	health = 0


#Player Stats
## Refers to the health of the player during a round
var health: int = 3:
	set(value):
		health = maxi(0,value)
		if health <= 0:
			death()

## Refers to the multiplier to the player's base damage
var damage_multiplier: int = 1

## Refers to how much currency the player has earned in the current round
var reward: int = 0

## Damages the player's current health
func damage(_damage:int) -> void:
	health -= _damage

## Performs the player death sequence; granting earned currency,
## unloading enemies and the stage,
## as well as returning the player to the shop
func death() -> void:
	get_parent().end_game(reward)
	pass
