extends Node2D

@export var scenes :Array [PackedScene]

func _ready():
	for scene in scenes:
		var tmp = scene.instance()
		add_child(self,tmp)
