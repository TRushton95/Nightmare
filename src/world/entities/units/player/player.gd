extends CharacterBody2D
class_name Player

signal interactable_entered
signal interactable_exited

@export var movespeed = 400
var interaction_candidates := []


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		_handle_interact()


func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * movespeed
	move_and_slide()


func add_interaction_candidate(candidate: Node2D) -> void:
	interaction_candidates.push_back(candidate)
	interactable_entered.emit()


func remove_interaction_candidate(candidate: Node2D) -> void:
	interaction_candidates.erase(candidate)
	interactable_exited.emit()


func _handle_interact() -> void:
	if interaction_candidates.is_empty():
		return
		
	var interactable = interaction_candidates.front()
	
	if !interactable.has_method("interact"):
		push_error("Attempted to interact with an invalid interactable")
		return
		
	interactable.interact()