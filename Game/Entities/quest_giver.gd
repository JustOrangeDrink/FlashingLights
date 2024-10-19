extends CharacterBody2D


const SPEED = 300.0


func _physics_process(_delta: float) -> void:
	$CommonAnimationPlayer.play_common_animation(self, $AnimatedSprite2D)
