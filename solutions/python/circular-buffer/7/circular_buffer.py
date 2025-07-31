class BufferFullException(BufferError):
    """Exception raised when CircularBuffer is full.

    message: explanation of the error.

    """


class BufferEmptyException(BufferError):
    """Exception raised when CircularBuffer is empty.

    message: explanation of the error.

    """


class CircularBuffer:

    def __init__(self, capacity):
        self.capacity = capacity
        self.structure = [None] * capacity
        self.size = 0
        self.head = 0

    def read(self):
        if self.size == 0:
            raise BufferEmptyException("Circular buffer is empty")

        tail = abs(self.size - self.head) % self.capacity
        self.size -= 1

        return self.structure[tail]

    def write(self, data):
        if self._is_full():
            raise BufferFullException("Circular buffer is full")

        self.structure[self.head % self.capacity] = data

        self.head += 1
        self.size += 1

    def overwrite(self, data):
        if self._is_full():
            self.read()

        self.write(data)

    def clear(self):
        self.head = 0
        self.size = 0

    def _is_full(self):
        return self.size == self.capacity
