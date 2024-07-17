@tool
@icon("res://addons/hex-tile-grid/hex_3d.svg")
class_name Hex3D
extends Node3D

@export var axial_coord: Vector2:
	set(new_coords):
		hex.axial_coordinates = new_coords
		var cart_2D_coords := hex.cartesian_coordinates
		position = Vector3(cart_2D_coords.x, position.y, cart_2D_coords.y)
	get:
		return hex.axial_coordinates

@export var size: float = 1.0:
	set(new_size):
		hex.size = new_size
		axial_coord = axial_coord
		update_gizmos()
	get:
		return hex.size

var hex: Hex = Hex.new()


func _ready() -> void:
	set_notify_transform(true)


func _notification(what: int) -> void:
	if what == NOTIFICATION_TRANSFORM_CHANGED:
		hex.cartesian_coordinates = Vector2(position.x, position.z)
