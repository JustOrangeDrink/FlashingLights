extends Node
class_name CommonAnimationPlayer

func play_common_animation(entity: CharacterBody2D, sprite: AnimatedSprite2D) -> void:
	if entity.velocity == Vector2.ZERO:
		sprite.play("Idle")
	else:
		sprite.play("Walk")
