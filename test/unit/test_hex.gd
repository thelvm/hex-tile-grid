extends GutTest

func test_hex_coordinates():
	var hex: Hex = Hex.new()
	assert_accessors(hex, "cartesian_coordinates", Vector2.ZERO, Vector2(7, -5))
	
	hex.axial_coordinates = Vector2(3, -4)
	assert_eq(hex.cube_coordinates, Vector3(3, -4, 1))
