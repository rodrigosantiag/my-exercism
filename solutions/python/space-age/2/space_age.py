from datetime import datetime, timedelta

ORBITS = {
    "earth": 1,
    "mercury": 0.2408467,
    "venus": 0.61519726,
    "mars": 1.8808158,
    "jupiter": 11.862615,
    "saturn": 29.447498,
    "uranus": 84.016846,
    "neptune": 164.79132,
}

YEAR_IN_SECONDS = 31557600


class SpaceAge:
    def __init__(self, seconds):
        self.seconds = seconds

    def on_earth(self):
        return round(self.seconds / YEAR_IN_SECONDS / ORBITS["earth"], 2)

    def on_mercury(self):
        return round(self.seconds / YEAR_IN_SECONDS / ORBITS["mercury"], 2)

    def on_venus(self):
        return round(self.seconds / YEAR_IN_SECONDS / ORBITS["venus"], 2)

    def on_mars(self):
        return round(self.seconds / YEAR_IN_SECONDS / ORBITS["mars"], 2)

    def on_jupiter(self):
        return round(self.seconds / YEAR_IN_SECONDS / ORBITS["jupiter"], 2)

    def on_saturn(self):
        return round(self.seconds / YEAR_IN_SECONDS / ORBITS["saturn"], 2)

    def on_uranus(self):
        return round(self.seconds / YEAR_IN_SECONDS / ORBITS["uranus"], 2)

    def on_neptune(self):
        return round(self.seconds / YEAR_IN_SECONDS / ORBITS["neptune"], 2)
