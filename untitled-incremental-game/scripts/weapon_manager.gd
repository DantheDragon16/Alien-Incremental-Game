extends Area2D
class_name WeaponManager
var is_shooting: bool = false
var damage: int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		monitoring = true
		await get_tree().create_timer(0.1).timeout
		monitoring = false


func _on_body_entered(body: Node2D) -> void:
	body.health -= damage
	pass # Replace with function body.
