extends Node3D

var rotation_speed : float

var base_y : float

func _ready() -> void:
	base_y = position.y

func _process(delta: float) -> void:
	rotate_y(deg_to_rad(-rotation_speed * delta))
