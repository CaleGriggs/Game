extends Node3D

@export var Bullet_Scene : PackedScene
var Flash : SpotLight3D

func _ready() -> void:
	Flash = get_node("SpotLight3D")
	
func _flash() -> void:
	Flash.visible = true
	await get_tree().create_timer(.01).timeout
	Flash.visible = false

func _fire_gun() -> void:
	var new_bullet = Bullet_Scene.instantiate()
	get_tree().current_scene.add_child(new_bullet)
	new_bullet._setup(self.global_transform)
	_flash()
	
func _process(delta: float) -> void:
	pass
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
	#	_fire_gun()
	
