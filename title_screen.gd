extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_startbtn_pressed() -> void:
	if get_tree().change_scene_to_file("res://Levels/tutorial.tscn") != OK:
		print("SOMETHING IS WRONG")


func _on_quitbtn_pressed() -> void:
	get_tree().quit()
