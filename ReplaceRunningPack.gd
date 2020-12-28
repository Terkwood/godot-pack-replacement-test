extends Node2D

const _NEW_PCK_PATH = 1

func _path_to_main_pck():
	pass

func _is_editor_mode():
	if OS.has_feature("editor"):
		return true
	else:
		return false

func _on_WaitToRun_timeout():
	#if _is_editor_mode():
	#	$Display.text = "Sorry, you need to run this outside of the editor."
	#	return
	
	if OS.get_executable_path().get_base_dir() == "/Applications/Godot.app/Contents/MacOS":
		$Display.text = "Using the system install of Godot... "
		var pf = File.new()
		if pf.file_exists("test.pck"):
			$Display.text += "Found `test.pck`.  Trying to overwrite `export/main.pck`..."
			var pd = Directory.new()
			if pd.copy("test.pck", "export/main.pck") == OK:
				$Display.text += " Success! Now let's reload our original PCK... "
				ProjectSettings.load_resource_pack("export/main.pck")
				get_tree().change_scene("res://ReplaceRunningPack.tscn")
			else:
				$Display.text += " FAILED!  We're done here."
				return
		else:
			$Display.text += "!!! Could not find `test.pck`, abort !!!"
			return
	else:
		$Display.text = "Navigate around to find the file ... WIP!"
		return
	
