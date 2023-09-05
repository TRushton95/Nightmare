extends Node2D

signal player_interactable_entered
signal player_interactable_exited

@export var zombie_scene : PackedScene


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("spawn_zombie"):
		var zombie = zombie_scene.instantiate()
		add_child(zombie)
		zombie.set_target($Player)


func _on_player_interactable_entered() -> void:
	player_interactable_entered.emit()


func _on_player_interactable_exited() -> void:
	player_interactable_exited.emit()
