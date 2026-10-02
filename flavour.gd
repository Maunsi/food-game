extends Resource
class_name Flavour

@export_range(0, 10) var sweet: int = 0
@export_range(0, 10) var salty: int = 0
@export_range(0, 10) var sour: int = 0
@export_range(0, 10) var bitter: int = 0
@export_range(0, 10) var umami: int = 0

func combined_with(other: Flavour) -> Flavour:
	var result = Flavour.new()
	result.sweet = clamp(sweet + other.sweet, 0, 10)
	result.salty = clamp(salty + other.salty, 0, 10)
	result.sour = clamp(sour + other.sour, 0, 10)
	result.bitter = clamp(bitter + other.bitter, 0, 10)
	result.umami = clamp(umami + other.umami, 0, 10)
	return result
