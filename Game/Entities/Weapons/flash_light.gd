extends PointLight2D
class_name FlashLight

@onready var _directional_flipper = FlipSprite.new()
@onready var is_shooting: bool
@onready var is_scanning: bool
@onready var timer: int = 0

func _ready() -> void:
	visible = false

func control_shooting(entity: CharacterBody2D, sprite: AnimatedSprite2D):
	if is_shooting:
		_directional_flipper.flip_on_mouse(sprite)
		entity.velocity *= 0.5
		if !is_scanning:
			$Area2D/CollisionPolygon2D.disabled = false
	else:
		_directional_flipper.flip_on_movement(sprite, entity.velocity)
		visible = false
		$Area2D/CollisionPolygon2D.disabled = true

func play_switch_sound(switch_sound: AudioStreamPlayer2D):
	if Input.is_action_just_pressed("Left Mouse Button") or Input.is_action_just_pressed("Right Mouse Button"):
		switch_sound.pitch_scale = 1.2
		switch_sound.play()
	if Input.is_action_just_released("Left Mouse Button") or Input.is_action_just_released("Right Mouse Button"):
		switch_sound.pitch_scale = 1
		switch_sound.play()

func shoot_stable():
	look_at(get_global_mouse_position())
	is_shooting = true
	scale = Vector2(1, 0.8)
	visible = true
	color = "FFFFFF"

func scan():
	#TODO: Change scan so it is used to take a glance through the darkness
	is_shooting = true
	is_scanning = true
	scale = Vector2(3, 5)
	visible = true
	color = "00ad02"
	
	timer += 1
	if timer == 1:
		look_at(get_global_mouse_position())
	if timer < 40:
		$Area2D/CollisionPolygon2D.disabled = false
	if timer > 40:
		visible = false
		$Area2D/CollisionPolygon2D.disabled = true
		
	if timer == 50:
		timer = 0
