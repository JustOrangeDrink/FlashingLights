extends Node2D

var is_closed: bool

func _process(_delta: float) -> void:
	if $Player.position.y < 18.5 and $Player.position.x > 583 and $Player.position.x < 649 and !is_closed:
		$ConfirmationDialog.visible = true
		$Player.NO_INPUT = true
	else:
		$Player.NO_INPUT = false
	
	if $Player.position.y > 18.5:
		is_closed = false

func _on_confirmation_dialog_confirmed() -> void:
	get_tree().change_scene_to_file("res://Game/Arena/Arena.tscn")

func _on_confirmation_dialog_canceled() -> void:
	is_closed = true
	$ConfirmationDialog.visible = false
	
