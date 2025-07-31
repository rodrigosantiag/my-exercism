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
        self.structure = []

    def read(self):
        if self._is_empty():
            raise BufferEmptyException("Circular buffer is empty")

        element = self.structure[0]
        self.structure.pop(0)

        return element

    def write(self, data):
        if self._is_full():
            raise BufferFullException("Circular buffer is full")

        self.structure.append(data)

    def overwrite(self, data):
        if self._is_full():
            self.structure.pop(0)

        self.structure.append(data)

    def clear(self):
        self.structure = []

    def _is_full(self):
        return len(self.structure) == self.capacity

    def _is_empty(self):
        return len(self.structure) == 0
