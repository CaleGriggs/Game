extends Node3D

@export var rotation_speed: float = 60.0
@export var bob_height: float = 0.02
@export var bob_speed: float = .5

@export var Bag_Rotation: NodePath
@export var Ring_Rotaion: NodePath
@export var Area_Collision: NodePath

@export var Team_Color: Color = Color(255,255,255)

var Ring_Mesh = MeshInstance3D
var Bag_Mesh = MeshInstance3D

var Hidden : bool = false

func _hide_bag() -> void:
	if Hidden:
		Bag_Mesh.visible = false
	else:
		Bag_Mesh.visible = true	

func _on_enter(Body: Node3D) -> void:
		
	#Taking
	if Body.Team_Color != Team_Color and Body.Has_Bag == false:
		Body.Has_Bag = true
		Body.Bag_Node = self
		Hidden = true
		_hide_bag()
		
	#Scoring
	if Body.Team_Color == Team_Color and Body.Has_Bag == true:
		$"..".Team_Score += 1
		Body.Bag_Node.Hidden = false
		Body.Bag_Node._hide_bag()
		Body.Has_Bag = false
		Hidden = false
		_hide_bag()
		#print($"..".Team_Score)
		

func _ready():
	Ring_Mesh = $"Ring Mesh"
	Bag_Mesh = $"Bag Mesh"
	var Area = get_node(Area_Collision)
	
	Area.body_entered.connect(_on_enter)
	
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
