extends Node
class_name FlipSprite

var is_flipped: bool = false

func flip_on_movement(sprite: Node2D, velocity: Vector2) -> void:
	"""Flips character sprite depending on direction of the movement. First parameter is Sprite2D OR AnimatedSprite2D"""
	"""P.S.: At the moment of writing Godot didnt have union types, if they are added then change sprite parameter"""
	if velocity.x < 0:
		is_flipped = true
	elif is_flipped and !velocity:
		is_flipped = true
	elif is_flipped and velocity.y and !velocity.x:
		is_flipped = true
	else:
		is_flipped = false
	
	sprite.flip_h = is_flipped

func flip_on_mouse(sprite: Node2D):
	"""Check flip_on_movement for description"""
	if sprite.get_local_mouse_position().x < 0:
		is_flipped = true
	else:
		is_flipped = false
	
	sprite.flip_h = is_flipped
