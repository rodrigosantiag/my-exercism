"""Solution to Ellen's Alien Game exercise."""
from typing import List, Tuple


class Alien:
    """Create an Alien object with location x_coordinate and y_coordinate.

    Attributes
    ----------
    (class)total_aliens_created: int
    x_coordinate: int - Position on the x-axis.
    y_coordinate: int - Position on the y-axis.
    health: int - Amount of health points.

    Methods
    -------
    hit(): Decrement Alien health by one point.
    is_alive(): Return a boolean for if Alien is alive (if health is > 0).
    teleport(new_x_coordinate, new_y_coordinate): Move Alien object to new coordinates.
    collision_detection(other): Implementation TBD.
    """

    total_aliens_created = 0

    def __init__(self, x_coordinate, y_coordinate):
        self.x_coordinate = x_coordinate
        self.y_coordinate = y_coordinate
        self.health = 3
        Alien.total_aliens_created += 1

    def hit(self):
        self.health -= 1

    def is_alive(self) -> bool:
        if self.health <= 0:
            return False

        return True

    def teleport(self, x_coordinate: int, y_coordinate: int):
        self.x_coordinate = x_coordinate
        self.y_coordinate = y_coordinate

    def collision_detection(self, other_object):
        pass


def new_aliens_collection(aliens_positions: List[Tuple[int, int]]) -> List[Alien]:
    aliens = []

    for alien_position in aliens_positions:
        x_coordinate, y_coordinate = alien_position
        aliens.append(Alien(x_coordinate, y_coordinate))

    return aliens
