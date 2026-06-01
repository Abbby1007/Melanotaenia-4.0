extends Node2D

var platform = preload("res://kill_platform.tscn")
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#randomize()
	#var y = 0
	#while y > - 3000:
		#var new_platforms = platform.instantiate()
		##new_platforms.set_pos(Vector2(0,y))
		#add_child(new_platforms)
		#y -= randf_range(0,210)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
