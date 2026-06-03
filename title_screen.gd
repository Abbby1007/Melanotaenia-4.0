extends Control
#WILL NEED TO FIX THE SCRIPT AND POSITIONING OF EVERYTHING LATER
@onready var highscore := $highscore as Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	highscore.text = "HIGHSCORE:\n" + str(Global.highscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_startbtn_pressed() -> void:
	if get_tree().change_scene_to_file("res://Levels/tutorial.tscn") != OK:
		print("SOMETHING IS WRONG")


func _on_quitbtn_pressed() -> void:
	get_tree().quit()
