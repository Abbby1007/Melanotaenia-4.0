extends Node2D

@onready var platform_container := $platform_container as Node2D
@onready var  platform_initial_position_y = $platform_container/killPlatform.position.y

@onready var camera := $camera as Camera2D
@onready var player := $Player as CharacterBody2D


@export var platform_scene: PackedScene
#45 - 357
func level_generator(amount):
	for items in amount:
		platform_initial_position_y -= randf_range(120,150)
		var new_platform = platform_scene.instantiate() as StaticBody2D
		new_platform.position = Vector2(randf_range(45,357),platform_initial_position_y)
		platform_container.add_child(new_platform)
	print(amount)

func _ready() -> void:
	randomize()
	level_generator(20)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.position.y < camera.position.y:
		camera.position.y = player.position.y



func _on_platform_cleaner_body_entered(body: Node2D) -> void:
	call_deferred("_delete_and_generate", body)

func _delete_and_generate(body: Node2D) -> void:
	if is_instance_valid(body):
		body.queue_free()
	level_generator(1)
