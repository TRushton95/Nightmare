extends StaticBody2D

var _enabled := false

@onready var _anim_player : AnimationPlayer = $AnimationPlayer


func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body is Player:
		body.add_interaction_candidate(self)


func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body is Player:
		body.remove_interaction_candidate(self)


func interact() -> void:
	set_enabled(!_enabled)


func set_enabled(value: bool) -> void:
	if value && !_enabled:
		_anim_player.play("off")
	elif !value && _enabled:
		_anim_player.play("on")
		
	_enabled = value
