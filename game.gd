extends Node

@export var spawner: PackedScene
var score

func cloud_timeout():
	var cloud = spawner.instantiate()
	
	var cloud_location = $CloudPath/CloudLocation
	cloud_location.progress_ratio = randf()
	cloud.position = cloud_location.postion
	add_child(cloud)
