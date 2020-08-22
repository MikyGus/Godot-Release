# Debugviewer
<B>Debugviewer</B><BR>
![Debugviewer](./Readme/debugviewer.png)![scene-tree](./Readme/scene-tree.png)
	
An addon to be placed in the scene-tree. View your variables in realtime.<BR>
  1. Download the "\2020 - AddonsProjects\addons\debug_viewer\" folder to your projects addons-folder..<BR>
  2. Enable the addon in Project->Project Settings->Plugins<BR>
  3. In your scene-tree, add the node "DebugView"<BR>
  4. To add your own variables and functions:<BR>
  Extend the script. 
  <pre><code>extends "res://addons/debug_viewer/debug_viewer.gd"
onready var match3 : match3grid = get_node("..")

func _process(delta: float) -> void:
	._process(delta)
	add_value("Position", str(match3.position))
	add_value("Grid Size", str(match3.grid_size))
	add_value("Tiles in grid", get_dictionary_string(match3._tiles_in_grid))</code></pre>