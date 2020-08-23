extends Node
class_name StateMachine

signal state_changed(current_state)

export(Dictionary) var states_map := {}
export(String) var START_STATE : String

var current_state : String setget set_current_state


func _ready() -> void:
	assert(states_map.has(START_STATE))
	current_state = START_STATE


func set_current_state(state_name : String) -> void:
	if not states_map.has(state_name):
		return
	current_state = state_name
