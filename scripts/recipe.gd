extends Resource
class_name Recipe

@export var input_ingredients: Array[Resource] = []
@export var output_dish: Dish

func matches(ingredients: Array[Resource]) -> bool:
	if ingredients.size() != input_ingredients.size():
		return false
		
	var ingredient_ids = ingredients.map(func(i): return i.id)
	var input_ingredient_ids = input_ingredients.map(func(i): return i.id)
	ingredient_ids.sort()
	input_ingredient_ids.sort()
	return ingredient_ids == input_ingredient_ids


	
	
