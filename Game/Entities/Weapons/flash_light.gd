extends PointLight2D
class_name FlashLight

@onready var _directional_flipper = FlipSprite.new()

func _ready() -> void:
	visible = false

func control_shooting(entity: CharacterBody2D, sprite: Node2D):
	if visible:
		entity.velocity *= 0.5
		_directional_flipper.flip_on_mouse(sprite)
	else:
		_directional_flipper.flip_on_movement(sprite, entity.velocity)
