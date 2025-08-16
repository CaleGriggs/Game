extends Node3D

@export var Projectile : Node3D
@export var fire_rate : Timer

#var can_shoot = true

func _shoot() -> void:
	%"Projectile Spawn"._fire_gun()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Primary_Fire"):
		_shoot()
		#print("pew")	
		fire_rate.start()
		#dcan_shoot = false
	if Input.is_action_just_released("Primary_Fire"):
		#can_shoot = false
		fire_rate.stop()


func _on_timer_timeout() -> void:
	#can_shoot = true
	_shoot()
	#print("timer done")
