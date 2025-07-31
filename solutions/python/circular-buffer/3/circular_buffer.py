class BufferFullException(BufferError):
    """Exception raised when CircularBuffer is full.

    message: explanation of the error.

    """
    pass


class BufferEmptyException(BufferError):
    """Exception raised when CircularBuffer is empty.

    message: explanation of the error.

    """
    pass


class CircularBuffer:

    def __init__(self, capacity):
        self.capacity = capacity
        self.structure = [None] * capacity
        self.size = 0
        self.head = 0
        self.tail = 0

    def read(self):
        if self.size == 0:
            raise BufferEmptyException("Circular buffer is empty")

        element = self.structure[self.tail]
        self.structure[self.tail] = None
        self.tail = (self.tail + 1) % self.capacity
        self.size -= 1

        return element

    def write(self, data):
        if self.size == self.capacity:
            raise BufferFullException("Circular buffer is full")

        self.structure[self.head] = data
        self.head = (self.head + 1) % self.capacity
        self.size += 1

    def overwrite(self, data):
        if self.size < self.capacity:
            self.write(data)
        else:
            self.structure[self.head] = data
            self.tail = (self.tail + 1) % self.capacity
            self.head = (self.head + 1) % self.capacity

    def clear(self):
        self.structure = [None] * self.capacity
        self.head = 0
        self.tail = 0
        self.size = 0
