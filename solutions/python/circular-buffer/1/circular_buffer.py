class BufferFullException(BufferError):
    """Exception raised when CircularBuffer is full.

    message: explanation of the error.

    """
    def __init__(self, message):
        pass


class BufferEmptyException(BufferError):
    """Exception raised when CircularBuffer is empty.

    message: explanation of the error.

    """
    def __init__(self, message):
        pass


class CircularBuffer:
    def __init__(self, capacity):
        self.capacity = capacity
        self.structure = [None] * capacity
        self.pointer = 0
        self.initial_position = 0

    def read(self):
        if not any(self.structure):
            raise BufferEmptyException("Circular buffer is empty")

        element = self.structure[self.initial_position]
        self.structure[self.initial_position] = None
        next_position = self.initial_position + 1
        self.initial_position = next_position if next_position <= len(self.structure) - 1 else 0

        return element

    def write(self, data, overwrite=False):
        if not overwrite and all(self.structure):
            raise BufferFullException("Circular buffer is full")

        next_position = self.pointer + 1
        self.structure[self.pointer] = data
        self.pointer = next_position if next_position <= len(self.structure) - 1 else 0

    def overwrite(self, data):
        if all(self.structure):
            next_position = self.initial_position + 1
            self.initial_position = next_position if next_position <= len(self.structure) - 1 else 0

        self.write(data, True)

    def clear(self):
        self.structure = [None] * self.capacity
        self.pointer = 0
        self.initial_position = 0
