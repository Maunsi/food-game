extends Area2D

@export var item_texture: Texture2D
@onready var sprite: Sprite2D = %Sprite2D

var dragging := false
var grab_offset := Vector2.ZERO

func _ready():
	if item_texture:
		sprite.texture = item_texture

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		dragging = true
		grab_offset = global_position - get_global_mouse_position()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		dragging = false

func _process(_delta):
	if dragging:
		global_position = get_global_mouse_position() + grab_offset
