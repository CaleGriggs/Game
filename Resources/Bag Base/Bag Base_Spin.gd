extends Node3D

var rotation_speed : float 
var bob_height : float
var bob_speed : float

var base_y : float

func _ready() -> void:
	base_y = position.y

func _process(delta: float) -> void:
	rotate_y(deg_to_rad(rotation_speed * delta))
	
	position.y = base_y + sin(Time.get_ticks_msec() / 1000.0 * TAU * bob_speed) * bob_height
