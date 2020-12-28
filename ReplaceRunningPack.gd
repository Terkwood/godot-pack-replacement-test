extends Node2D

const _NEW_PCK_PATH = 1

func _path_to_main_pck():
	pass

func _is_editor_mode():
	if OS.has_feature("standalone"):
		return true
	else:
		return false

func _on_WaitToRun_timeout():
	if _is_editor_mode():
		$Display.text = "Sorry, you need to run this outside of the editor."
		return
	
	if OS.get_executable_path().get_base_dir() == "/Applications/Godot.app/Contents/MacOS":
		$Display.text = "Using the system install of Godot... "
		var pf = File.new()
		if pf.file_exists("test.pck"):
			$Display.text += "Found `test.pck`.  Trying to overwrite `export/main.pck`..."
		else:
			$Display.text += "!!! Could not find `test.pck`, abort !!!"
			return
	else:
		$Display.text = "Navigate around to find the file ... WIP!"
	
