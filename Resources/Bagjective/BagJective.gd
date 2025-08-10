extends Node3D


@export var rotation_speed: float = 60.0
@export var bob_height: float = 0.02
@export var bob_speed: float = .5

@export var Bag_Rotation: NodePath
@export var Ring_Rotaion: NodePath

@export var Team_Color: Color = Color(255,255,255)

@export var Hidden : bool = false


func _ready():
	var Ring_Mesh = $"Ring Mesh"
	var Bag_Mesh = $"Bag Mesh"
	
	
	if Hidden:
		Bag_Mesh.visible = false
	else:
		Bag_Mesh.visible = true	
	
	var Bag_Material = Bag_Mesh.get_surface_override_material(0)
	if Bag_Material == null:
		Bag_Material = StandardMaterial3D.new()
		Bag_Mesh.set_surface_override_material(0, Bag_Material)
	Bag_Material.albedo_color = Team_Color
	
	var Ring_Material = Ring_Mesh.get_surface_override_material(0)
	if Ring_Material == null:
		Ring_Material = StandardMaterial3D.new()
		Ring_Mesh.set_surface_override_material(0, Ring_Material)
	Ring_Material.albedo_color = Team_Color
	

	
	
	
	var child = get_node(Bag_Rotation)
	if child:
		child.rotation_speed = rotation_speed
		child.bob_height = bob_height
		child.bob_speed = bob_speed
		
	var ring = get_node(Ring_Rotaion)
	if ring:
		ring.rotation_speed = rotation_speed
