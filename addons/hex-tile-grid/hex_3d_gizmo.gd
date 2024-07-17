extends EditorNode3DGizmoPlugin


func _init() -> void:
	create_material("hex_outline", Color.from_string("#ffca5f", Color.WHITE), false, true)


func _has_gizmo(for_node_3d: Node3D) -> bool:
	return for_node_3d is Hex3D


func _get_gizmo_name() -> String:
	return "Hex3D"


func _redraw(gizmo: EditorNode3DGizmo) -> void:
	gizmo.clear()
	
	var hex3d := gizmo.get_node_3d() as Hex3D
	
	var lines := PackedVector3Array()
	lines.push_back(Vector3(0.866, 0, 0.5) * hex3d.size)
	lines.push_back(Vector3(0, 0, 1) * hex3d.size)
	lines.push_back(Vector3(0, 0, 1) * hex3d.size)
	lines.push_back(Vector3(-0.866, 0, 0.5) * hex3d.size)
	lines.push_back(Vector3(-0.866, 0, 0.5) * hex3d.size)
	lines.push_back(Vector3(-0.866, 0, -0.5) * hex3d.size)
	lines.push_back(Vector3(-0.866, 0, -0.5) * hex3d.size)
	lines.push_back(Vector3(0, 0, -1) * hex3d.size)
	lines.push_back(Vector3(0, 0, -1) * hex3d.size)
	lines.push_back(Vector3(0.866, 0, -0.5) * hex3d.size)
	lines.push_back(Vector3(0.866, 0, -0.5) * hex3d.size)
	lines.push_back(Vector3(0.866, 0, 0.5) * hex3d.size)
	gizmo.add_lines(lines, get_material("hex_outline", gizmo))
	
