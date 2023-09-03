extends CharacterBody2D

@export var movespeed = 400


func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * movespeed
	move_and_slide()
