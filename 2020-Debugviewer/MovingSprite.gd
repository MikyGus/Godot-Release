extends Sprite

enum State {IDLE,WALKING,RESTING}
onready var _current_state : int = State.IDLE

var _start_position := Vector2(200,200) 
var _from_position := _start_position
var _target_position := Vector2.ZERO
var _time_walking := 0.0
var _duration_walking := 10.0


func _ready() -> void:
	position = _start_position


func _process(delta: float) -> void:
	match _current_state:
		State.IDLE:
			_resting()
		State.WALKING:
			_walking(delta)


func _resting() -> void:
	_current_state = State.RESTING
	yield(get_tree().create_timer(1),"timeout")
	_target_position.x = _start_position.x * rand_range(1.0,3.0)
	_target_position.y = _start_position.y * rand_range(1.0,3.0)
	_current_state = State.WALKING


func _walking(_delta : float) -> void:
	if position.distance_to(_target_position) > 0.5:
		position = position.linear_interpolate(_target_position,0.05)
	elif position != _target_position:
		position = _target_position
	else:
		_current_state = State.IDLE
		_time_walking = 0.0
