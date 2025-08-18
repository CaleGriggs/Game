extends Node3D

@export var Projectile : Node3D
@export var fire_rate : Timer


@export var ammo_capacity : float = 200
@export var magazine_capacity : float = 50
@export var magazine : float
@export var ammo : float


func _ready() -> void:
	fire_rate.wait_time = 0.113
	magazine = magazine_capacity
	ammo = ammo_capacity
	
func _shoot() -> void:
	if magazine:
		%"Projectile Spawn"._fire_gun()
		magazine -= 1
		print(magazine, " | ", magazine_capacity)
	else:
		print("click")

func _process(delta: float) -> void:
	if magazine <= 0:
		magazine = 0
		
	if Input.is_action_just_pressed("Primary_Fire"):
		_shoot()
		fire_rate.start()

	if Input.is_action_just_released("Primary_Fire"):
		fire_rate.stop()
		
	if Input.is_action_just_pressed("Reload"):
		if ammo <= 0:
			print("No Ammo")
		var diff = magazine_capacity - magazine
		if diff <= ammo:
			magazine += diff
			ammo -= diff
		else:
			magazine += ammo
			ammo = 0
		print("Reload: ", ammo, " | ",  ammo_capacity, " || ", magazine, " | ", magazine_capacity)
		print(diff)

func _on_timer_timeout() -> void:
	_shoot()
