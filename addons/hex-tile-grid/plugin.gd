@tool
extends EditorPlugin

var hex3DGizmo = preload("res://addons/hex-tile-grid/hex_3d_gizmo.gd").new()


func _enter_tree() -> void:
	add_node_3d_gizmo_plugin(hex3DGizmo)


func _exit_tree() -> void:
	remove_node_3d_gizmo_plugin(hex3DGizmo)
