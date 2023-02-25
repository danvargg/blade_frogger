extends Control


func _process(delta):
	$"TestScore".text = "Score: " + str(Global.score)

	if Input.is_action_pressed("start_game"):
		get_tree().change_scene("res://Level/Level.tscn")  # FIXME: godot warning
		Global.score = 0
