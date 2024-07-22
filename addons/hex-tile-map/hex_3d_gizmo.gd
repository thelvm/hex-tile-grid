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
	var points := hex3d.hex.get_hex_points()	
	var lines := PackedVector3Array()
	var num_points := points.size()
	for i in range(num_points):
		var line_start = Vector3(points[i].x, 0, points[i].y)
		var line_end = Vector3(points[(i+1) % num_points].x, 0, points[(i+1) % num_points].y)
		lines.append(line_start)
		lines.append(line_end)
	gizmo.add_lines(lines, get_material("hex_outline", gizmo))
	
