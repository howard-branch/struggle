extends Node2D

const HEX_SIZE = 64.0
@export var hex_tile_scene: PackedScene

func _ready():
    generate_map(5)

func generate_map(radius: int):
    for q in range(-radius, radius + 1):
        for r in range(max(-radius, -q - radius), min(radius, -q + radius) + 1):
            var tile = hex_tile_scene.instantiate()
            tile.position = hex_to_pixel(q, r)
            $HexMap.add_child(tile)

func hex_to_pixel(q: int, r: int) -> Vector2:
    var x = HEX_SIZE * sqrt(3) * (q + r * 0.5)
    var y = HEX_SIZE * 1.5 * r
    return Vector2(x, y)
