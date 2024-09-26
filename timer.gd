extends Timer

@export var scenes :Array [PackedScene]

var random_scene = RandomNumberGenerator.new()
var selected_scene_index = 0

func _on_timer_timeout():
	random_scene.randomize()
	selected_scene_index = random_scene.randi_range(0,scenes.size()-1)
	var tmp = scenes[selected_scene_index].instantiate()
	add_child(tmp)
