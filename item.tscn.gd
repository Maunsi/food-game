extends Area2D


var dragging := false
var grab_offset := Vector2.ZERO
@export var texture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	if texture:
		print("self.texture before {self.texture()}")
		self.texture = texture
		print("self.texture after {self.texture()}")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging:
		print_debug(delta, dragging)
		self.position = get_global_mouse_position() + grab_offset

func _input_event(_viewport, event, _shape_idx):
	print_debug(event)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		dragging = true
		grab_offset = global_position - get_global_mouse_position()

func _input(event):
	print_debug(event)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		dragging = false
