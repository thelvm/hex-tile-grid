## A Hex that positions itself in 3D space.
## The local Y axis is independent of the position on the hex grid and can be set manually.
@tool
@icon("res://addons/hex-tile-map/hex_3d.svg")
class_name Hex3D
extends Node3D

## The local hex grid axial coordinates.
@export var axial_coord := Vector2(0, 0):
	set(new_coords):
		hex.axial_coordinates = new_coords
		var cart_2D_coords := hex.cartesian_coordinates
		position = Vector3(cart_2D_coords.x, position.y, cart_2D_coords.y)
	get:
		if Vector2(position.x, position.z) != hex.cartesian_coordinates:
			hex.cartesian_coordinates = Vector2(position.x, position.z)
		return hex.axial_coordinates

## The size of the Hex. Directly affects position as the cartesian coordinates are influenced by both axial coordinates and size.
@export var size: float = 1.0:
	set(new_size):
		hex.size = new_size
		axial_coord = axial_coord
		update_gizmos()
	get:
		return hex.size

## The underlying hex. Can be used to get other formats of the coordinaes. Editing positions directly to it is not recommended.
var hex: Hex = Hex.new()


func _ready() -> void:
	set_notify_transform(true)


func _notification(what: int) -> void:
	if what == NOTIFICATION_TRANSFORM_CHANGED:
		hex.cartesian_coordinates = Vector2(position.x, position.z)
