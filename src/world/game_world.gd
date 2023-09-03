extends Node2D

signal player_interactable_entered
signal player_interactable_exited


func _on_player_interactable_entered() -> void:
	player_interactable_entered.emit()
	print("GameWorld emited interactable entered event")


func _on_player_interactable_exited() -> void:
	player_interactable_exited.emit()
