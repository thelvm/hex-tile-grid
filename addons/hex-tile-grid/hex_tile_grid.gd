## Represents a grid of hex tiles.
class_name HexTileGrid
extends RefCounted

@export_storage var _tiles: Dictionary

## Adds a hex tile at the specified axial coordinates and returns a reference to the just added tile.
## If a tile already exists at these coordinates, returns it instead
func set_tile_at(coords: Vector2, new_tile: Hex) -> Hex:
	_tiles[coords] = new_tile
	return _tiles[coords]
