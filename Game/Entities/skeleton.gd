extends CharacterBody2D

@export var speed: int = 30

@onready var is_taking_damage: bool = false

func _ready() -> void:
	motion_mode = MOTION_MODE_FLOATING
	$AnimatedSprite2D.play("Walk")

func _physics_process(_delta: float) -> void:
	velocity = position.direction_to(get_node("../Player").position) * speed
	move_and_slide()
	if is_taking_damage:
		print("Ow!")
		#TODO: Add damage animation
	$DirectionalFlipper.flip_on_movement($AnimatedSprite2D, self.velocity)


func _on_area_2d_area_entered(_area: Area2D) -> void:
	is_taking_damage = true


func _on_area_2d_area_exited(_area: Area2D) -> void:
	is_taking_damage = false
