extends CharacterBody2D

@onready var _camera = $Camera2D
@onready var _animated_sprite = $AnimatedSprite2D
@onready var _walk = $WalkingSound
@onready var _flash_light = $FlashLight
@onready var _common_animation_player = $CommonAnimationPlayer

@export var speed: int = 50

var is_flash_light_active = false

func _ready() -> void:
	_camera.limit_left = 0
	_camera.limit_right = get_viewport().size.x - 214
	_camera.limit_top = 0
	_camera.limit_bottom = get_viewport().size.y - 128

func _physics_process(_delta: float) -> void:
	get_input()
	_flash_light.control_shooting(self, _animated_sprite)
	move_and_slide()
	_walk.walking_sound(self)
	_flash_light.look_at(get_global_mouse_position())
	_common_animation_player.play_common_animation(self, _animated_sprite)
	
func get_input() -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	
	is_flash_light_active = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	_flash_light.visible = is_flash_light_active
	if Input.is_action_just_pressed("Left Mouse Button"):
		$SwitchFlashLight.pitch_scale = 1.2
		$SwitchFlashLight.play()
	if Input.is_action_just_released("Left Mouse Button"):
		$SwitchFlashLight.pitch_scale = 1
		$SwitchFlashLight.play()
