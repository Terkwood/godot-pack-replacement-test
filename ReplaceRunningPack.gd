extends Node2D

const _NEW_PCK_PATH = 1

func _path_to_main_pck():
	pass

func _is_editor_mode():
	return true

func _on_WaitToRun_timeout():
	if _is_editor_mode():
		$Display.text = "Sorry, you need to run this outside of the editor."
	else:
		$Display.text = "WIP"
