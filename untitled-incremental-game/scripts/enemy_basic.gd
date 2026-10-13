extends Node2D
class_name EnemyBasic
var health = 3:
	set(value):
		health = maxi(0,value)
		if health <= 0:
			death()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_pos(_pos: Vector2):
	global_position = _pos
	
func death():
	queue_free()
