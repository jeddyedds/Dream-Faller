extends Node2D

@export var scenes :Array [PackedScene]

#func _ready():
	#for scene in scenes:
		#var tmp = scene.instantiate()
		#add_child(tmp)

var random_scene = RandomNumberGenerator.new()
var selected_scene_index = 0
#var random_x = RandomNumberGenerator.new()
#var abc = random_x.randf_range(0, 500)

func _on_timer_timeout() -> void:
	random_scene.randomize()
	selected_scene_index = random_scene.randi_range(0,scenes.size()-1)
	var tmp = scenes[selected_scene_index].instantiate()
	add_child(tmp)
