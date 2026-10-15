extends Area2D
class_name WeaponManager
var is_shooting: bool = false
var damage: int = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		monitoring = true
		await get_tree().create_timer(0.1).timeout
		monitoring = false


func _on_body_entered(body: EnemyBasic) -> void:
	body.health -= damage
