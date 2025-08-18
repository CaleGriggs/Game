extends Node3D

var setup : bool = true
@export var player_id : int = 0
@export var divice_id : int = 0
var Child : CharacterBody3D

@export var Character : PackedScene

@export var Team : Node
@export var Team_Color : Color

var Move_Dir : Vector2
var Jump : bool = false

func _setup() -> void:
	Team = get_parent()
	Team_Color = Team.Team_Color
	setup = false
	Child = get_child(0)
	Child.Team_Color = Team_Color

func _ready() -> void:
	setup = true
	Child = get_child(0)
	
func _process(delta: float) -> void:
	if setup:
		_setup()
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		get_child(0)._camera_move(event)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Sprint"):
		Child.set_move_speed(true)
	else:
		Child.set_move_speed(false)
	if Input.is_action_just_pressed("Jump"):
		Jump = true
	elif Input.is_action_just_released("Jump"):
		Jump = false

func _move() -> void:
	Move_Dir = Input.get_vector("Move_Left","Move_Right","Move_Up","Move_Down").normalized()
