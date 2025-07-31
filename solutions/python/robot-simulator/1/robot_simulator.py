# Globals for the directions
# Change the values as you see fit
EAST = (1, 0)
NORTH = (0, 1)
WEST = (-1 ,0)
SOUTH = (0, -1)

TURNS = {
    "R": {
        NORTH: EAST,
        EAST: SOUTH,
        SOUTH: WEST,
        WEST: NORTH
    },
    "L": {
        NORTH: WEST,
        WEST: SOUTH,
        SOUTH: EAST,
        EAST: NORTH
    }
}


class Robot:
    def __init__(self, direction=NORTH, x_pos=0, y_pos=0):
        self.direction = direction
        self.coordinates = x_pos, y_pos

    def __set_direction(self, direction):
        self.direction = TURNS[direction][self.direction]

    def move(self, actions: str):
        for action in actions:
            if action == "A":
                self.coordinates = tuple(map(sum, zip(self.coordinates, self.direction)))
            else:
                self.__set_direction(action)
