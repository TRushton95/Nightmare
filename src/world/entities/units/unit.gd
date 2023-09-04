extends CharacterBody2D
class_name Unit

@export var movespeed = 400


func _physics_process(delta: float) -> void:
	velocity = _get_velocity()
	move_and_slide()


func _get_velocity() -> Vector2:
	return Vector2.ZERO
