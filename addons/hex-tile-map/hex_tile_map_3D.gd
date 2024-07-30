@tool
@icon("res://addons/hex-tile-map/hex_tile_map_3D.svg")
class_name HexTileMap3D
extends Node3D

var hex_grid: HexTileMap

var _visual_hexs: Array[Hex3D]


func set_tile(axial_position, ) -> void:
	hex_grid.set_tile_at(axial_position)
