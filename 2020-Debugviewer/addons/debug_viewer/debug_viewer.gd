"""
Example of an extended script for extra monitored variables:

extends "res://addons/debug_viewer/debug_viewer.gd"
onready var sprite : Sprite = get_node("../../Sprite")
func _process(delta: float) -> void:
	._process(delta)
	add_value("Position", str(sprite.position))
	add_value("Print a dictionary", get_dictionary_string(dictionary_variable))
"""

extends Panel

export(bool) var Show_FPS := true
export(bool) var Show_StaticMemory := true
export(bool) var Show_Locale := false
export(bool) var Show_Keyboard := false
export(bool) var Show_ModelName := false
export(bool) var Show_WindowPosition := true
export(bool) var Show_WindowSize := true
export(bool) var Show_Game_Paused := false
export(bool) var Show_Global_Mouse_Position := false
export(bool) var Show_Local_Mouse_Position := false


var _label := Label.new()
var _label_text := ""
var _label_OS_text := ""

func _ready() -> void:
	theme = load("res://addons/debug_viewer/addon_theme.theme")
	_label.rect_position = Vector2(10,10)
	add_child(_label)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	pause_mode = Node.PAUSE_MODE_PROCESS

	
func _process(_delta: float) -> void:
	if Show_FPS:
		add_OS_value("Frames per second", str(Engine.get_frames_per_second()))	
	if Show_StaticMemory:
		add_OS_value("Static Memory", String.humanize_size(OS.get_static_memory_usage()))
	if Show_Locale:
		add_OS_value("Locale", OS.get_locale())
	if Show_Keyboard:
		add_OS_value("Keyboard", OS.get_latin_keyboard_variant())
	if Show_ModelName:
		add_OS_value("Modelname", OS.get_model_name())
	if Show_WindowPosition:
		add_OS_value("Window Position", str(OS.get_window_position()))
	if Show_WindowSize:
		add_OS_value("Window Size", str(OS.get_window_size()))
	if Show_Game_Paused:
		add_OS_value("Game Paused", str(get_tree().paused))
	if Show_Global_Mouse_Position:
		add_OS_value("Mouse Position", str(get_global_mouse_position()))
	if Show_Local_Mouse_Position:
		add_OS_value("Mouse Position", str(get_local_mouse_position()))
	_commit_values()
	
	
func add_value(title : String, value : String) -> void:
	_label_text += title + ": " + value + "\n"


func add_OS_value(title : String, value : String) -> void:
	_label_OS_text += title + ": " + value + "\n"
	
	
func _commit_values() -> void:
	if _label_text.length() > 0 and _label_OS_text.length() == 0:
		_label.text = _label_text
	elif _label_text.length() > 0 and _label_OS_text.length() > 0:
		_label.text = _label_text + "\n" + "_".repeat(30) + "\n" + _label_OS_text
	else:
		_label.text = _label_OS_text
	_label_text = ""
	_label_OS_text = ""
	

func get_dictionary_string(dic : Dictionary) -> String:
	var return_value := ""
	for d in dic:
		return_value += "\n" + " ".repeat(3) + str(d) + ": " + str(dic[d])
	return return_value
	
	
#func _get_value(sourceNode : NodePath) -> String:
#	return str(get_node(sourceNode).position)
#
#
#func _get_configuration_warning() -> String:
#	if not sourceNode:
#		return "Source Node not set!"
#	else:
#		return ""
