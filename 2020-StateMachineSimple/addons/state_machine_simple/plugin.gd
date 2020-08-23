tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("StateMachine", "Node", preload("res://addons/state_machine_simple/state_machine.gd"), preload("res://addons/state_machine_simple/icon.png"))



func _exit_tree() -> void:
	remove_custom_type("StateMachine")
