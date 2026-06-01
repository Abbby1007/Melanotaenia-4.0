extends Node2D

@onready var platform_container := $platform_container
@onready var  platform_initial_position_y = $platform_container/killPlatform.position.y

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
	level_generator(20)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
