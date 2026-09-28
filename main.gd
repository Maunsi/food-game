extends Node2D

const INGREDIENT_SCENE = preload("res://ingredient.tscn")

func _ready():
	var dir = DirAccess.open("res://sprites/")
	var pos = Vector2(4*20,4*20)
	for file_name in dir.get_files():
		if file_name.ends_with(".png"):
			var texture = load("res://sprites/" + file_name)
			var ingredient = INGREDIENT_SCENE.instantiate()
			ingredient.item_texture = texture
			add_child(ingredient)
			ingredient.position = pos
			pos += Vector2(4*60, 0)
