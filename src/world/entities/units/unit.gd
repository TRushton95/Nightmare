extends CharacterBody2D
class_name Unit

@export var movespeed : int = 250


func _physics_process(delta: float) -> void:
	velocity = _get_velocity(delta)
	move_and_slide()


func _get_velocity(delta: float) -> Vector2:
	return Vector2.ZERO
