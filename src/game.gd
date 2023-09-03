extends Node

@onready var game_ui = $GameUI


func _on_game_world_player_interactable_entered() -> void:
	print("Game found event")
	game_ui.set_interact_prompt_visibility(true)


func _on_game_world_player_interactable_exited() -> void:
	game_ui.set_interact_prompt_visibility(false)
