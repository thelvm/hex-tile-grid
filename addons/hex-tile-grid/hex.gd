## Practical implementation of a hexagon and all the quirks of "hexagonal spaces".[br]
## Everything is explained in details here: [url]https://www.redblobgames.com/grids/hexagons/[/url][br]
## Huge thanks to Red Blob Games for their incredibly detailed explanations
class_name Hex
extends RefCounted

## The distance from the hexagon's center to its corners.
## In the context of hexagonal geometry, the dimensions of width and height are not identical. One of the dimentions will be [code]sqrt(3) * size[/code] while the other will be [code]2 * size[/code].
@export_storage var size: float = 1.0

## Coordinates in the axial coordinates system.
## The values of x and y are the same for the cube and axial coordinate system.
@export_storage var axial_coordinates: Vector2

## Coordinates in the cube coordinates system.
## The values of x and y are the same for the cube and axial coordinate system. In the cube system, z is defined as z = -x - y
var cube_coordinates: Vector3:
	get = get_cube_coordinates

## Coordinates in standard cartesian 2D space
var cartesian_coordinates: Vector2:
	get = get_cartesian_coordinates, set = set_cartesian_coordinates


## Utility function that returns all the points composing the hex
func get_hex_points() -> PackedVector2Array:
	# TODO
	var points := PackedVector2Array()
	for angle: int in range(0, 360, 60):
		points.append(Vector2(cos(deg_to_rad(angle)), sin(deg_to_rad(angle))))
	return points


#region Setters and Getters

func get_cube_coordinates() -> Vector3: 
	return Vector3(axial_coordinates.x, axial_coordinates.y, -axial_coordinates.x - axial_coordinates.y)


func get_cartesian_coordinates() -> Vector2:
	return Vector2((sqrt(3) * axial_coordinates.x) + ((sqrt(3) / 2.0) * axial_coordinates.y), \
	1.5 * axial_coordinates.y) * size


func set_cartesian_coordinates(new_coordinates: Vector2) -> void:
	axial_coordinates.x = (((sqrt(3) / 3.0 * new_coordinates.x)) - ((1 / 3.0) * new_coordinates.y)) / size
	axial_coordinates.y = ((2 / 3.0) * new_coordinates.y) / size
#endregion
