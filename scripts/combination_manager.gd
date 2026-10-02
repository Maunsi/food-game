# combination_manager.gd — autoload
extends Node

const COMBINABLE_SCENE = preload("res://scenes/combinable.tscn")

func resolve(a: Combinable, b: Combinable):
	prints("a", a)
	prints("b", a)
	var dish = RecipeBook.combine([a.contents, b.contents])
	prints("dish", dish)
	var result = COMBINABLE_SCENE.instantiate()
	prints("result", result)
	result.contents = dish
	result.position = a.position
	a.get_parent().add_child(result)
	a.queue_free()
	b.queue_free()
