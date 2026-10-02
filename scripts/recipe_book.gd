# recipe_book.gd — autoload
extends Node

@export var recipes: Array[Recipe] = []
var bad_dish: Dish = preload("res://resources/dishes/bad_dish.tres")

func _ready():
	recipes = [
		load("res://resources/recipes/nigiri_recipe.tres"),
	]

func combine(ingredients: Array[Resource]) -> Dish:
	for recipe in recipes:
		if recipe.matches(ingredients):
			return recipe.output_dish
	return bad_dish
	
