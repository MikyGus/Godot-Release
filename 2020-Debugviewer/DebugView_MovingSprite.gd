extends "res://addons/debug_viewer/debug_viewer.gd"

onready var sprite : Sprite = get_node("..")

func _process(delta: float) -> void:
	._process(delta)
	add_value("Position", str(sprite.position))
	add_value("Target", str(sprite._target_position))
	add_value("Distance", str(sprite.position.distance_to(sprite._target_position)))
	add_value("State", str(sprite.State.keys()[sprite._current_state]))
