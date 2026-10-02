extends Area2D
class_name Combinable

@onready var sprite: Sprite2D = %Sprite2D
var overlapping: Area2D = null
var dragging := false
var grab_offset := Vector2.ZERO
@export var contents: Resource:
	set(value):
		contents = value
		_apply_contents()

func _ready():
	_apply_contents()
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _input_event(_viewport, event, _shape_idx):
	#Not sure I want this, I still want to be able to grab them ?
	#if not can_combine():
		#return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		dragging = true
		grab_offset = global_position - get_global_mouse_position()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		if dragging and overlapping:
			_try_combine(overlapping)
		dragging = false

func _process(_delta):
	if dragging:
		global_position = get_global_mouse_position() + grab_offset

func can_combine() -> bool:
	if contents is Dish:
		return not contents.is_final
	return true

func _apply_contents():
	if contents and sprite:
		sprite.texture = contents.texture
		
func _on_area_entered(area: Area2D):
	overlapping = area

func _on_area_exited(area: Area2D):
	if overlapping == area:
		overlapping = null
		
func _try_combine(other: Combinable):
	if not can_combine() or not other.can_combine():
		return
	CombinationManager.resolve(self, other)
