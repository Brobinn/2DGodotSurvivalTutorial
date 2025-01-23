extends Node

@export_range(0, 1) var drop_precent: float = .5
@export var health_componant: Node
@export var vial_scene: PackedScene


func _ready():
	(health_componant as HealthComponent).died.connect(on_died)
	
	
func on_died():
	if randf() > drop_precent:
		return
	
	if vial_scene == null:
		return
	
	if not owner is Node2D: 
		return
		
	var spawn_position = (owner as Node2D).global_position
	var vial_instance = vial_scene.instantiate() as Node2D
	var entities_layer = get_tree().get_first_node_in_group("entities_layer")
	entities_layer.add_child(vial_instance)
	vial_instance.global_position = spawn_position
