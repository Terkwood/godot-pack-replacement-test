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
	
	var exec_dir = OS.get_executable_path().get_base_dir()
	if exec_dir == "/Applications/Godot.app/Contents/MacOS":
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
		$Display.text = "In %s. Looking for the main pack..." % exec_dir
		var pf = File.new()
		var split_exec_dir = exec_dir.split("/")
		var main_pack = ""
		for i in range(0, split_exec_dir.size() - 1):
			main_pack += "/%s" % split_exec_dir[i]
		main_pack += "/Resources/Unnamed.pck"
		main_pack = main_pack.substr(1)
		if !pf.file_exists(main_pack):
			$Display.text += "Not found (%s)!  Aborting." % main_pack
			return
		
		$Display.text += main_pack
		$Display.text += " Looking for the replacement..."
		# Note that this cp should be run by export.sh
		if !pf.file_exists("/tmp/000-test.pck"):
			$Display.text += "Not found!  Run export.sh to copy the replacement PCK into /tmp.  Aborting."
			return
		
		$Display.text += " Trying to copy over the main pack file... "
		var pd = Directory.new()
		if pd.copy("/tmp/000-test.pck", main_pack) == OK:
			$Display.text += " Success! Now let's reload our original PCK... "
			ProjectSettings.load_resource_pack(main_pack)
			get_tree().change_scene("res://ReplaceRunningPack.tscn")
		else:
			$Display.text += " FAILED!  Sorry."
		return
	
