extends RigidBody3D


func _setup(spawn_transform: Transform3D) -> void:
	self.global_transform = spawn_transform
	var forward_dir = (spawn_transform.basis * Vector3.RIGHT).normalized()
	self.linear_velocity = forward_dir * 500
	
func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 5
	connect("body_entered", Callable(self,"_on_body_entered"))
	pass
	
func _process(delta: float) -> void:
	if linear_velocity.length() <= 5:
		queue_free()
		#print("too slow")

func _physics_process(delta: float) -> void:	
	pass

func _on_body_entered(body: Node):
	#print("Bullet Hit: ", body.name)
	if get_contact_count() == 5:
		queue_free()
