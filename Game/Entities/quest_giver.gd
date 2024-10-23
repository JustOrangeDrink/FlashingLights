extends CharacterBody2D


const SPEED = 300.0

func _ready() -> void:
	motion_mode = MOTION_MODE_FLOATING

func _physics_process(_delta: float) -> void:
	move_and_slide()
	$CommonAnimationPlayer.play_common_animation(self, $AnimatedSprite2D)
