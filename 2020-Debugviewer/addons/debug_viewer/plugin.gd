tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("DebugView", "Panel", preload("res://addons/debug_viewer/debug_viewer.gd"), preload("res://addons/debug_viewer/icon.png"))


func _exit_tree() -> void:
	remove_custom_type("DebugView")
