## Represents a grid of hex tiles.
class_name HexTileMap
extends RefCounted

@export var tiles_size: float = 1.0

@export_storage var _tiles: Dictionary

## Adds a hex tile at the specified axial coordinates and returns a reference to the just added tile.
func set_tile_at(coords: Vector2, new_tile: Hex) -> Hex:
	_tiles[coords] = new_tile
	return _tiles[coords]


## Converts the local coordinates into axial grid coordinates. Setting snap to true returns the axial coordinates snapped to the grid.
func local_to_grid(local_position: Vector2, snap := false) -> Vector2:
	var hex := Hex.new()
	hex.size = tiles_size
	hex.cartesian_coordinates = local_position
	if snap:
		return hex.axial_coordinates.round()
	else:
		return hex.axial_coordinates
