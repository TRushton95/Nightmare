extends Node2D

signal player_interactable_entered
signal player_interactable_exited


func _on_player_interactable_entered() -> void:
	player_interactable_entered.emit()


func _on_player_interactable_exited() -> void:
	player_interactable_exited.emit()
