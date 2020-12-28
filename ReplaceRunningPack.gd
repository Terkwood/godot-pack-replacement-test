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
	else:
		$Display.text = "WIP: executable base dir is %s" % OS.get_executable_path().get_base_dir()
