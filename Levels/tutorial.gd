extends Node2D

@onready var platform_container := $platform_container as Node2D
@onready var  platform_initial_position_y = $platform_container/killPlatform.position.y

@onready var camera := $camera as Camera2D
@onready var player := $Player as CharacterBody2D

@onready var score_label := $camera/score as Label
@onready var camera_start_position = $camera.position.y 

var score := 0

@export var platform_scene: PackedScene
#45 - 357
func level_generator(amount):
	for items in amount:
		var num = randi_range(0,1) 
		platform_initial_position_y -= randf_range(150,170)
		var new_platform = platform_scene.instantiate() as StaticBody2D
		if(num == 0):
			#Meidum sea green
			new_platform.modulate = Color(0, 0.98039216, 0.6039216, 1)
		elif (num == 1):
			#Sadny brown
			new_platform.modulate = Color(0.95686275, 0.6431373, 0.3764706, 1)
			
		
		new_platform.position = Vector2(randf_range(41,321),platform_initial_position_y)
		platform_container.call_deferred("add_child",new_platform)
	print(amount)

func _ready() -> void:
	randomize()
	level_generator(20)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.position.y < camera.position.y:
		camera.position.y = player.position.y
	score_update()
	
func go_title_scene():
	get_tree().change_scene_to_file("res://title_screen.tscn")
	
func delete_object(obstacle):
	if obstacle.name == "Player":
		print("Player fell")
		if score > Global.highscore:
			Global.highscore = score
		call_deferred("go_title_scene")
		#This is where the death screen will pop up
	else:
		obstacle.queue_free()
		level_generator(1)

func _on_platform_cleaner_body_entered(body: Node2D) -> void:
	delete_object(body)

func score_update():
	score = camera_start_position - camera.position.y
	Global.gScore = score
	score_label.text = str(int(score))
