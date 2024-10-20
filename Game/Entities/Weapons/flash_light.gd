extends PointLight2D
class_name FlashLight

@onready var _directional_flipper = FlipSprite.new()
@onready var is_shooting: bool
@onready var is_scanning: bool
@onready var timer: int = 0

func _ready() -> void:
	visible = false

func control_shooting(entity: CharacterBody2D, sprite: Node2D):
	if is_shooting:
		_directional_flipper.flip_on_mouse(sprite)
		if is_scanning:
			entity.velocity *= 0.5
	else:
		_directional_flipper.flip_on_movement(sprite, entity.velocity)
		visible = false

func play_switch_sound(switch_sound: AudioStreamPlayer2D):
	if Input.is_action_just_pressed("Left Mouse Button") or Input.is_action_just_pressed("Right Mouse Button"):
		switch_sound.pitch_scale = 1.2
		switch_sound.play()
	if Input.is_action_just_released("Left Mouse Button") or Input.is_action_just_released("Right Mouse Button"):
		switch_sound.pitch_scale = 1
		switch_sound.play()

func shoot_stable():
	is_shooting = true
	scale = Vector2(0.7, 0.7)
	visible = true
	color = "FFFFFF"
	energy = 4
	look_at(get_global_mouse_position())

func scan():
	is_shooting = true
	is_scanning = true
	scale.y = 1.5
	visible = true
	color = "00ad02"
	energy = 3
	
	timer += 1
	if timer == 1:
		look_at(get_global_mouse_position())
	if timer < 40:
		visible = true
	if timer > 40:
		visible = false
	if timer == 50:
		timer = 0
