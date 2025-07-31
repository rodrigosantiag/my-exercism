class Clock:
    def __init__(self, hour, minute):
        self.hour = hour
        self.minute = minute

    def __repr__(self):
        return f"Clock({self.hour}, {self.minute})"

    def __str__(self):
        minute = self.minute % 60
        hour = self.hour + (self.minute // 60)
        return f"{str(hour % 24).rjust(2, '0')}:{str(minute).rjust(2, '0')}"

    def __eq__(self, other):
        return str(self) == str(other)

    def __add__(self, minutes):
        return Clock(self.hour, self.minute + minutes)

    def __sub__(self, minutes):
        return Clock(self.hour, self.minute - minutes)
