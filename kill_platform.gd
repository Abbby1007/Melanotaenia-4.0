extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:

	if body.is_in_group("player"):
		if $"../Player".modulate != modulate:
			get_tree().call_deferred("reload_current_scene")
	#If player is not the same size as the paltform then kill them
	#if body.name == "Player":
		#print("TEST")
		#if $"../Player".modulate != modulate:
			#get_tree().call_deferred("reload_current_scene")
