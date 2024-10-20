extends PointLight2D
class_name FlashLight

@onready var _directional_flipper = FlipSprite.new()
@onready var is_shooting: bool = false
@onready var timer: int = 0

# Variables for blinking light
@export_group("Blinking Light")
@export_range(0, 20) var blink_frequency: int = 7
@export_range(0, 20) var blink_duration: int = 8
## Pick to which colors light will be switched when blinking
@export var colors: Array[Color] = ["ff84ff", "a7bbe9"]
var switch = false

func _ready() -> void:
	# Not needed here
	#visible = false
	pass
	

func control_shooting(entity: CharacterBody2D, sprite: Node2D):
	if is_shooting:
		entity.velocity *= 0.4
		_directional_flipper.flip_on_mouse(sprite)
		# Affects variant(2) because constantly changes visible to true
		#visible = true
	else:
		_directional_flipper.flip_on_movement(sprite, entity.velocity)
		visible = false

func shoot_stable():
	# If we change color in blinking light, this light will be affected too
	# So we just change color here to white
	color = "ffffff"
	is_shooting = true

func shoot_flash():
	is_shooting = true
	#var red
	#var blue
	#TODO: Add change of color after each flash
	timer += 1
	#if timer < 7:
		#visible = true
	#else:
		#visible = false
	#if timer == 15:
		#timer = 0
	
	color = colors[int(switch)]
	# In this variant(1) we can only adjust blink frequency
	#if timer == blink_frequency:
		#visible = !visible
		## Change light color only if light is visible
		#if visible:
			#switch = !switch
		#timer = 0
	
	# In this variant(2) we can adjust frequency and duration of blink
	if timer < blink_frequency:
		visible = true
	if timer > blink_frequency:
		visible = false
		if timer == (blink_frequency + blink_duration):
			# Change color before light starts flashing
			switch = !switch
			timer = 0
