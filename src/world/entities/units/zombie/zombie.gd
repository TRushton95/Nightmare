extends Unit
class_name Zombie

@onready var _nav_agent : NavigationAgent2D = $NavigationAgent2D
@onready var _path_update_timer : Timer = $PathUpdateTimer

var _target : Node2D


func _on_path_update_timer_timeout() -> void:
	if _target:
		_nav_agent.target_position = _target.position


func _ready() -> void:
	_nav_agent.max_speed = movespeed


func _get_velocity(delta: float) -> Vector2:
	if _nav_agent.is_navigation_finished():
		return Vector2.ZERO
		
	var next_path_position = _nav_agent.get_next_path_position()
	var direction = (next_path_position - global_position).normalized()
	var result = direction * movespeed
	
	return result


func set_target(target: Node2D) -> void:
	_target = target
	
	if _target:
		_nav_agent.target_position = _target.position
		_path_update_timer.stop()
		_path_update_timer.start()
