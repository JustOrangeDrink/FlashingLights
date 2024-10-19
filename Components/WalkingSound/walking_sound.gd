extends AudioStreamPlayer2D
class_name WalkingSound

@export var walk_timer: Timer
@export var wait_time: float

func walking_sound(entity: CharacterBody2D, walk_pitch_lowest: float = 0.8, walk_pitch_highest: float = 1.3):
	walk_timer.one_shot = true
	if entity.velocity:
		if walk_timer.time_left <= 0:
			self.pitch_scale = randf_range(walk_pitch_lowest, walk_pitch_highest)
			self.play()
			walk_timer.start(wait_time)
