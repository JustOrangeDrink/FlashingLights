extends PointLight2D
class_name FlashLight

@onready var _directional_flipper = FlipSprite.new()
@onready var is_shooting: bool = false
@onready var timer: int = 0

func _ready() -> void:
	visible = false
	

func control_shooting(entity: CharacterBody2D, sprite: Node2D):
	if is_shooting:
		entity.velocity *= 0.4
		_directional_flipper.flip_on_mouse(sprite)
		visible = true
	else:
		_directional_flipper.flip_on_movement(sprite, entity.velocity)
		visible = false

func shoot_stable():
	is_shooting = true

func shoot_flash():
	is_shooting = true
	timer += 1
	if timer < 7:
		visible = true
	else:
		visible = false
	if timer == 15:
		timer = 0
