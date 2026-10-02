extends Node2D

const COMBINABLE_SCENE = preload("res://scenes/combinable.tscn")

func _ready():
	var dir_path = "res://resources/ingredients/"
	var dir = DirAccess.open(dir_path)
	var pos = Vector2(80, 80)
	for ingredient_file in dir.get_files():
		if not ingredient_file.ends_with(".tres"):
			continue
		var ingredient = load(dir_path + ingredient_file)
		var combinable = COMBINABLE_SCENE.instantiate()
		combinable.contents = ingredient
		combinable.position = pos
		add_child(combinable)
		pos += Vector2(80, 0)
