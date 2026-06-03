extends Node2D

@onready var platform_container := $platform_container as Node2D
@onready var  platform_initial_position_y = $platform_container/killPlatform.position.y

@onready var camera := $camera as Camera2D
@onready var player := $Player as CharacterBody2D

@onready var score_label := $camera/score as Label
@onready var camera_start_position = $camera.position.y 

var score = 0

@export var platform_scene: PackedScene
#45 - 357
func level_generator(amount):
	for items in amount:
		platform_initial_position_y -= randf_range(150,170)
		var new_platform = platform_scene.instantiate() as StaticBody2D
		new_platform.position = Vector2(randf_range(45,320),platform_initial_position_y)
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

func delete_object(obstacle):
	if obstacle.name == "Player":
		print("Player fell")
		get_tree().change_scene_to_file("res://title_screen.tscn")
		#This is where the death screen will pop up
	else:
		obstacle.queue_free()
		level_generator(1)

func _on_platform_cleaner_body_entered(body: Node2D) -> void:
	delete_object(body)

func score_update():
	score = camera_start_position - camera.position.y
	score_label.text = str(int(score))
